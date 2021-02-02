import re
import pathlib
import itertools
import collections

from pycldf import Sources
from nameparser import HumanName
from clldutils.misc import nfilter, slug
from clldutils.color import qualitative_colors
from clld.cliutil import Data, bibtex2source
from clld.db.meta import DBSession
from clld.db.models import common
from clld.lib import bibtex
from markdown import markdown

from clld_glottologfamily_plugin.util import load_families
from pycldf import iter_datasets

import hindukush
from hindukush import models

subgroup_shapes = {
    'Indo-Aryan': 't',
    'Nuristani': 'c',
    'Iranian': 's',
}


def html(s):
    return s
    s = re.sub(r'\*-\*\*(?P<bold>[a-z]+)\*\*\*', lambda m: '***-{}***'.format(m.group('bold')), s)
    s = re.sub(r'^\((?P<number>[0-9]+)\)\s+', lambda m: '{}. '.format(m.group('number')), s)
    return markdown(s, extensions=['tables', 'fenced_code'])


def main(args):
    #
    # FIXME: more generic:
    # - run iter_datasets(args.cldf) -> assuming args.cldf is a directory! -> must go in clld!
    # - Store datasets in defaultdict(list) keyed with module
    #
    datasets = {}
    for ds in iter_datasets(args.cldf.directory):
        datasets[ds.module] = ds

    assert args.glottolog, 'The --glottolog option is required!'

    data = Data()
    thedataset = data.add(
        common.Dataset,
        hindukush.__name__,
        id=hindukush.__name__,
        name='Hindu Kush Areal Typology',
        domain='hindukush.clld.org',

        publisher_name="Max Planck Institute for the Science of Human History",
        publisher_place="Jena",
        publisher_url="http://www.shh.mpg.de",
        license="http://creativecommons.org/licenses/by/4.0/",
        jsondata={
            'license_icon': 'cc-by.png',
            'license_name': 'Creative Commons Attribution 4.0 International License'},

    )
    for i, name in enumerate(['Henrik Liljegren', 'Robert Forkel', 'Nina Knobloch', 'Noa Lange']):
        common.Editor(
            dataset=thedataset,
            ord=i,
            contributor=common.Contributor(id=slug(HumanName(name).last), name=name)
        )

    for rec in bibtex.Database.from_file(pathlib.Path(__file__).parent / 'HK_website.bib', lowercase=True):
        data.add(common.Source, rec.id, _obj=bibtex2source(rec))

    for rec in bibtex.Database.from_file(args.cldf.bibpath, lowercase=True):
        data.add(common.Source, rec.id, _obj=bibtex2source(rec))

    refs = collections.defaultdict(list)
    for module, ds in sorted(datasets.items(), key=lambda i: i[0]):
        for lang in ds.iter_rows('LanguageTable', 'id', 'glottocode', 'name', 'latitude', 'longitude'):
            if lang['id'] not in data['Variety']:
                data.add(
                    models.Variety,
                    lang['id'],
                    id=lang['id'],
                    name=lang['name'],
                    latitude=lang['latitude'],
                    longitude=lang['longitude'],
                    glottocode=lang['glottocode'],
                    subgroup=lang['SubGroup'],
                    location=lang['Location'],
                    elicitation=lang['Elicitation'],
                    jsondata=dict(shape=subgroup_shapes.get(lang['SubGroup'])),
                )

        contrib = data.add(
            models.CLDFDataset,
            module,
            id=module,
            name='{} [{}]'.format(ds.properties.get('dc:title'), module),
            description=ds.properties.get('dc:bibliographicCitation'),
            module=module,
        )

        if module == 'Wordlist':
            for param in ds.iter_rows('ParameterTable', 'id', 'concepticonReference', 'name'):
                data.add(
                    models.Param,
                    param['id'],
                    id=param['id'],
                    name='{} [{}]'.format(param['name'], param['id']),
                    sortkey=param['id'] if not param['id'].startswith('Numerals') else
                    'Numerals-{0:03d}'.format(int(param['id'].split('-')[1])),
                    concepticon_id=param['concepticonReference'],
                    contribution=contrib,
                    category=param['domain'] or 'ASJPlist',
                )

            audio = {r['ID']: r for r in ds.iter_rows('media.csv') if r['mimetype'] == 'audio/mpeg'}
            for form in ds.iter_rows('FormTable', 'id', 'form', 'languageReference', 'parameterReference',
                                     'source'):
                vsid = (form['languageReference'], form['parameterReference'])
                vs = data['ValueSet'].get(vsid)
                if not vs:
                    vs = data.add(
                        common.ValueSet,
                        vsid,
                        id='-'.join(vsid),
                        language=data['Variety'][form['languageReference']],
                        parameter=data['Param'][form['parameterReference']],
                        contribution=contrib,
                    )
                for ref in form.get('source', []):
                    sid, pages = Sources.parse(ref)
                    refs[(vsid, sid)].append(pages)
                mp3 = next(iter([audio[aid] for aid in form['Audio_Files'] if aid in audio]), None)
                data.add(
                    common.Value,
                    form['id'],
                    id=form['id'],
                    name=form['form'],
                    valueset=vs,
                    jsondata=dict(audio=ds.get_row_url('media.csv', mp3) if mp3 else None),
                )
        elif module == 'StructureDataset':
            for param in ds.iter_rows('ParameterTable', 'id', 'name', 'description'):
                data.add(
                    models.Param,
                    param['id'],
                    id=param['id'],
                    name=param['name'],
                    description=html(param['description'])
                    if param['description'] else None,
                    category=param['Category'],
                    contribution=contrib,
                )
            for code in ds.iter_rows('CodeTable', 'id', 'name', 'description', 'parameterReference'):
                data.add(
                    common.DomainElement,
                    code['id'],
                    id=code['id'],
                    name=code['name'],
                    description=code['description'],
                    parameter=data['Param'][code['parameterReference']],
                    jsondata={'color': {
                        'absent': 'ff0000',
                        'present': '0000ff',
                        'indeterminate': 'cccccc',
                    }.get(code['description'])}
                )
            #
            # FIXME: read CodeTable!
            #
            for form in ds.iter_rows('ValueTable', 'id', 'value', 'languageReference', 'parameterReference',
                                     'codeReference', 'source'):
                vsid = (form['languageReference'], form['parameterReference'])
                vs = data['ValueSet'].get(vsid)
                if not vs:
                    vs = data.add(
                        common.ValueSet,
                        vsid,
                        id='-'.join(vsid),
                        language=data['Variety'][form['languageReference']],
                        parameter=data['Param'][form['parameterReference']],
                        contribution=contrib,
                    )
                for ref in form.get('source', []):
                    sid, pages = Sources.parse(ref)
                    refs[(vsid, sid)].append(pages)
                data.add(
                    common.Value,
                    form['id'],
                    id=form['id'],
                    name=form['value'],
                    valueset=vs,
                    domainelement=data['DomainElement'][form['codeReference']]
                )

    for (vsid, sid), pages in refs.items():
        DBSession.add(common.ValueSetReference(
            valueset=data['ValueSet'][vsid],
            source=data['Source'][sid],
            description='; '.join(nfilter(pages))
        ))
    load_families(
        Data(),
        [(l.glottocode, l) for l in data['Variety'].values()],
        glottolog_repos=args.glottolog,
        isolates_icon='tcccccc',
        strict=False,
    )



def prime_cache(args):
    """If data needs to be denormalized for lookup, do that here.
    This procedure should be separate from the db initialization, because
    it will have to be run periodically whenever data has been updated.
    """
