from zope.interface import implementer
from sqlalchemy import (
    Column,
    String,
    Unicode,
    Integer,
    Boolean,
    ForeignKey,
    UniqueConstraint,
)
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy.ext.hybrid import hybrid_property

from clld import interfaces
from clld.db.meta import Base, CustomModelMixin, DBSession
from clld.db.models import common

from clld_glottologfamily_plugin.models import HasFamilyMixin


@implementer(interfaces.ILanguage)
class Variety(CustomModelMixin, common.Language, HasFamilyMixin):
    pk = Column(Integer, ForeignKey('language.pk'), primary_key=True)
    glottocode = Column(Unicode)
    subgroup = Column(Unicode)
    location = Column(Unicode)
    elicitation = Column(Unicode)


@implementer(interfaces.IContribution)
class CLDFDataset(CustomModelMixin, common.Contribution):
    pk = Column(Integer, ForeignKey('contribution.pk'), primary_key=True)
    module = Column(Unicode)


@implementer(interfaces.IParameter)
class Param(CustomModelMixin, common.Parameter):
    pk = Column(Integer, ForeignKey('parameter.pk'), primary_key=True)
    sortkey = Column(Unicode)
    concepticon_id = Column(Unicode)
    category= Column(Unicode)
    contribution_pk = Column(Integer, ForeignKey('cldfdataset.pk'))
    contribution = relationship(CLDFDataset, backref='parameters')

    @property
    def type(self):
        return 'feature' if self.contribution.module == 'StructureDataset' else (
            'concept' if self.contribution.module == 'Wordlist' else None
        )

    @classmethod
    def get_categories(cls, contrib):
        return sorted((
            c for c, in DBSession.query(cls.category)
            .filter(cls.contribution == contrib).distinct() if c))
