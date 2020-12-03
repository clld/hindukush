from sqlalchemy.orm import joinedload
from clld.db.models import common
from clld.db.util import get_distinct_values
from clld.web import datatables
from clld.web.datatables.base import LinkCol, Col, LinkToMapCol, IdCol, DetailsRowLinkCol
from clld.web.datatables.parameter import Parameters
from clld.web.datatables.value import Values, RefsCol
from clld.web.util.htmllib import HTML
from clld.web.util.helpers import icon
from clld.web.util import concepticon
from clldutils.misc import dict_merged

from clld_glottologfamily_plugin.models import Family
from clld_glottologfamily_plugin.datatables import FamilyCol

from hindukush import models


class Languages(datatables.Languages):
    def base_query(self, query):
        return query.join(Family).options(joinedload(models.Variety.family)).distinct()

    def col_defs(self):
        return [
            LinkCol(self, 'name'),
            FamilyCol(self, 'Family', models.Variety),
            Col(self, 'subgroup', model_col=models.Variety.subgroup),
            Col(self, 'location', model_col=models.Variety.location),
            Col(self,
                'latitude',
                sDescription='<small>The geographic latitude</small>'),
            Col(self,
                'longitude',
                sDescription='<small>The geographic longitude</small>'),
            LinkToMapCol(self, 'm'),
        ]


class ConcepticonCol(Col):
    def format(self, item):
        if not item.concepticon_id:
            return ''
        return concepticon.link(self.dt.req, id=item.concepticon_id)


def category_col(dt, **kw):
    return Col(
        dt,
        'category',
        model_col=models.Param.category,
        choices=models.Param.get_categories(models.CLDFDataset.get('StructureDataset')),
        **kw)


class Params(Parameters):
    __constraints__ = [common.Contribution]

    def base_query(self, query):
        query = query.join(common.Contribution).options(joinedload(models.Param.contribution))

        if self.contribution:
            return query.filter(models.Param.contribution_pk == self.contribution.pk)

        return query

    def col_defs(self):
        if self.contribution:
            if self.contribution.id == 'StructureDataset':
                return [
                    IdCol(self, 'id'),
                    LinkCol(self, 'name'),
                    category_col(self),
                    DetailsRowLinkCol(self, '#', button_text='values'),
                ]
            elif self.contribution.id == 'Wordlist':
                return [
                    LinkCol(self, 'name'),
                    ConcepticonCol(self, 'concepticon'),
                    Col(self,
                        'category',
                        model_col=models.Param.category,
                        choices=models.Param.get_categories(self.contribution)),
                ]
        return Parameters.col_defs(self)


class AudioCol(Col):
    def format(self, item):
        if item.jsondatadict['audio']:
            return HTML.audio(
                HTML.source(src=item.jsondata['audio'], type="audio/mpeg"),
                controls="controls"
            )
        return ''


#
# FIXME: remove "more" button, source column.
# proper map_marker_img for values! -> family marker for wordlist!
#
class Vals(Values):

    def __init__(self, req, model, **kw):
        self.module = kw.pop('module', req.params.get('module', None))
        if self.module:
            kw['eid'] = 'dt-values-' + self.module
        super(Values, self).__init__(req, model, **kw)

    def xhr_query(self):
        return dict_merged(super(Values, self).xhr_query(), module=self.module)

    def base_query(self, query):
        query = Values.base_query(self, query)

        if not self.parameter:
            query = query.join(common.ValueSet.parameter).join(models.Param.contribution)
            if self.module:
                query = query.filter(models.CLDFDataset.module == self.module)

        return query

    def col_defs(self):
        cols = Values.col_defs(self)
        if (self.parameter and self.parameter.contribution.id == 'Wordlist') \
                or self.module == 'Wordlist':
            cols.append(AudioCol(self, 'audio'))
        if (self.parameter and self.parameter.contribution.id == 'StructureDataset') \
                or self.module == 'StructureDataset':
            cols.append(category_col(self, get_object=lambda i: i.valueset.parameter))
        return [col for col in cols
                if not isinstance(col, DetailsRowLinkCol) and not isinstance(col, RefsCol)]


def includeme(config):
    """register custom datatables"""
    config.register_datatable('parameters', Params)
    config.register_datatable('languages', Languages)
    config.register_datatable('values', Vals)
