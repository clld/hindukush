<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "contributions" %>

<ul class="nav nav-pills" style="float: right">
    <li class="">
        <a href="#table-container">
            <img src="${req.static_url('hindukush:static/Table_Icon.png')}"
                 width="35">
            Table
        </a>
    </li>
</ul>

% if ctx.id == 'StructureDataset':
    <h2>Features</h2>
    <p>
        A feature, as the term is used here, is a structural property of a language. A conscious choice was made to
        define features binary. That means that a given language is classified as either displaying a particular feature
        (having the value=1) or that the feature is absent (having the value=0) as far as the present data set is
        concerned. In some cases, for instance when conclusive data is missing, it is marked as indeterminate.
    </p>
    <p>
        Our features are not meant to reflect all possible language properties. Instead they have been chosen
    </p>
    <ol type="a">
        <li>to represent areally relevant features, and</li>
        <li>to cover different parts of the language system (hence distributed
            across five macro-categories: Clause structure, Grammatical categories, Lexicon, Phonology and Word order).
        </li>
    </ol>
    <p>
        The choice of features to include is also constrained by our present, and relatively limited, data set.
    </p>
    <p>
        Each feature presentation contains: 1. A table showing the number of sample languages displaying the feature,
        the number of languages in which it is absent, and the number of languages for which the feature value is
        indeterminate. 2. A map showing the geographical distribution of feature values across the region. 3. A short
        prose description of the feature as it occurs in the region, accompanied by one or more illustrative examples
        drawn from the data set.
    </p>
    <p>
        Data references are given in the following way: Sample language-Data component-Language consultant:Item number.
        The reference HNO-Val-RH:061 should for instance be read as Hindko language data, provided by a consultant given
        the identifier RH, related to item number 061 in the Valency Questionnaire. Most of the data used in the feature
        descriptions belong to one of the seven components listed (along with their abbreviations) in Project design and
        data collection.
    </p>
    <p>
        The abbreviations in the interlinear glossing are to a large extent standard abbreviations according to the
        Leipzig Glossing Rules.
        Additional abbreviations are listed below.
    </p>
    <dl class="dl-horizontal">
        <dt>AN</dt>
        <dd>animate</dd>
        <dt>CONJ</dt>
        <dd>conjunction</dd>
        <dt>EMPH</dt>
        <dd>emphatic</dd>
        <dt>EQ</dt>
        <dd>equative copula</dd>
        <dt>ESS</dt>
        <dd>essive</dd>
        <dt>EX</dt>
        <dd>existential copula</dd>
        <dt>HF</dt>
        <dd>human feminine (gender)</dd>
        <dt>HM</dt>
        <dd>human masculine (gender)</dd>
        <dt>INAN</dt>
        <dd>inanimate</dd>
        <dt>MED</dt>
        <dd>medial (distance)</dd>
        <dt>R</dt>
        <dd>recipient (argument)</dd>
        <dt>T</dt>
        <dd>theme (argument)</dd>
        <dt>V</dt>
        <dd>verb</dd>
        <dt>X</dt>
        <dd>x (non-human gender)</dd>
        <dt>Y</dt>
        <dd>y (non-human gender)</dd>
    </dl>
% elif ctx.id == 'Wordlist':
    <h2>Wordlist</h2>
    <p>
        The wordlist is mainly generated from the processed wordlists that were part of the elicitation package (see
        <a href="${req.route_url('about', _anchor='project')}">Project design and data collection</a>).
        That is reflected in the category labels: ASJPlist, Kinship and Numerals.
    </p>
    <p>
        Selecting an item gives you a) a map of the region with the languages plotted and a label displaying a
        transcription for each language, b) a list displaying the languages alphabetically with the transcribed item for
        each. For a subset of the items, audio recordings are linked.
    </p>
    <p>
        We have aimed at providing a broad phonetic transcription of each item, using the International Phonetic
        Alphabet. While it is our intention to give each item an accurate written representation, the primary objective
        was not to represent phonemes or to consistently reflect language-internal phonological contrasts.
    </p>
    <p>
        Elicitation of kinship terms turned out to be particularly challenging. Although conscious efforts were made
        to carefully explain and guide the consultants prior to the recording sessions, we are aware that some of the
        terms listed, in a few of the languages, most likely are explanatory terms rather than reference terms actually
        used in the local community.
    </p>
% endif

<% dt = request.get_datatable('parameters', h.models.Parameter, contribution=ctx) %>
<div id="table-container">
    ${dt.render()}
</div>
