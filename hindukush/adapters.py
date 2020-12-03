from clldutils.misc import nfilter

from clld import interfaces
from clld.web.adapters.geojson import GeoJsonParameter, GeoJson


class HindukushGeoJsonParameter(GeoJsonParameter):

    def feature_properties(self, ctx, req, valueset):
        return {
            'values': list(valueset.values),
            'label': ', '.join(nfilter(v.name for v in valueset.values))
            if valueset.parameter.contribution.id == 'Wordlist'
            else self.get_language(ctx, req, valueset).name}


def includeme(config):
    config.register_adapter(
        HindukushGeoJsonParameter,
        interfaces.IParameter,
        name=GeoJson.mimetype)
