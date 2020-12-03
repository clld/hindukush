from clld.db.meta import DBSession
from clld.web.maps import Map, Layer, Legend, ParameterMap
from clld.web.util.htmllib import HTML
from clld.web.util.helpers import map_marker_img, JSNamespace

from hindukush.models import Variety


class LanguagesMap(Map):
    def get_options(self):
        return {
            'max_zoom': 12,
            'resize_direction': 's',
            'base_layer': 'Stamen.Terrain'}

    def get_layers(self):
        yield Layer(
            'languages',
            'Languages',
            self.req.route_url('languages_alt', ext='geojson'))

    def get_legends(self):
        items = []
        seen = set()

        def item(lang, label):
            return HTML.div(map_marker_img(self.req, lang), ' ', label, style="padding-left: 5px")

        for lang in DBSession.query(Variety).order_by(Variety.subgroup):
            if lang.subgroup:
                if lang.subgroup not in seen:
                    items.append(item(lang, lang.subgroup))
                    seen.add(lang.subgroup)
            else:
                family = lang.family.name if lang.family else 'Isolate'
                if family not in seen:
                    items.append(item(lang, family))
                    seen.add(family)
        yield Legend(self, 'sub-groups', items, label='Legend', stay_open=True)

        for legend in Map.get_legends(self):
            yield legend


class ParamMap(ParameterMap):
    def get_options(self):
        return {
            'with_audioplayer': self.ctx.contribution.id == 'Wordlist',
            'resize_direction': 's',
            'max_zoom': 12,
            'base_layer': 'Stamen.Terrain',
            'show_labels': self.ctx.contribution.id == 'Wordlist',
        }


def includeme(config):
    config.register_map('languages', LanguagesMap)
    config.register_map('parameter', ParamMap)
