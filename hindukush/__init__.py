import functools
import collections

from pyramid.config import Configurator

from clld_glottologfamily_plugin import util
from clld_glottologfamily_plugin.util import ISOLATES_ICON
from clld.web.app import menu_item
from clld.interfaces import IMapMarker, IValueSet, IValue, IDomainElement, ILanguage
from clldutils.svg import pie, icon, data_url

# we must make sure custom models are known at database initialization!
from hindukush import models

_ = lambda s: s
_('Source')
_('Sources')


def url(spec):
    return data_url(icon(spec, opacity=0.8))


class LanguageByFamilyMapMarker(util.LanguageByFamilyMapMarker):
    def __call__(self, ctx, req):
        if IDomainElement.providedBy(ctx):
            return url('c' + ctx.jsondata['color'])

        if IValue.providedBy(ctx):
            if ctx.domainelement:
                return url('c' + ctx.domainelement.jsondata['color'])
            return url(ctx.valueset.language.family.jsondata['icon'])

        if IValueSet.providedBy(ctx):
            #
            # FIXME: To add genericity, draw a pie chart respecting all values!
            #
            if ctx.values[0].domainelement:
                return url('c' + ctx.values[0].domainelement.jsondata['color'])
            if ctx.language.family:
                return url(ctx.language.family.jsondata['icon'])
            return url(req.registry.settings.get('clld.isolates_icon', ISOLATES_ICON))

        if ILanguage.providedBy(ctx):
            icon_ = super(LanguageByFamilyMapMarker, self).get_icon(ctx, req)
            if ctx.subgroup:
                icon_ = ctx.jsondata['shape'] + icon_[1:]
            return url(icon_)

        return super(LanguageByFamilyMapMarker, self).__call__(ctx, req)


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = Configurator(settings=settings)
    config.include('clld.web.app')

    config.include('clldmpg')

    config.register_menu(
        ('dataset', functools.partial(menu_item, 'dataset', label='Hindu Kush Areal Typology')),
        ('languages', functools.partial(menu_item, 'languages')),
        ('StructureDataset', lambda ctx, req: (req.route_url('contribution', id='StructureDataset'), 'Features')),
        ('Wordlist', lambda ctx, req: (req.route_url('contribution', id='Wordlist'), 'Wordlist')),
        ('sources', functools.partial(menu_item, 'sources')),
        ('about', lambda c, r: (r.route_url('about'), 'About')),
    )

    config.registry.registerUtility(LanguageByFamilyMapMarker(), IMapMarker)

    return config.make_wsgi_app()
