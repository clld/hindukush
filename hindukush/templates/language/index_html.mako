<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "languages" %>
<%block name="title">${_('Languages')}</%block>

<ul class="nav nav-pills" style="float: right">
    <li class="">
        <a href="#map-container">
            <img src="${req.static_url('hindukush:static/Map_Icon.png')}"
                 width="35">
            Map
        </a>
    </li>
    <li class="">
        <a href="#table-container">
            <img src="${req.static_url('hindukush:static/Table_Icon.png')}"
                 width="35">
            Table
        </a>
    </li>
</ul>

<h2>The Region and its Languages</h2>
<p>
    Hindu Kush, or the Greater Hindu Kush, in this context is really a shorthand for the remote region where the ranges
    of the Hindu Kush, the Karakoram, the Pamirs and the westernmost extension of the Himalayas meet
    (<a href="${req.route_url('source', id='liljegrensurvey2014')}">Liljegren 2014: 134–138</a>;
    <a href="${req.route_url('source', id='hockhanshenrichpre19472016')}">Bashir 2016: 264</a>).
    These northwestern outskirts of the subcontinent are inhabited by at least 50 distinct
    ethnolinguistic communities
    (<a href="${req.route_url('source', id='hammarstromglottolog2017')}">Hammarström, Forkel &amp; Haspelmath 2017</a>;
    <a href="${req.route_url('source', id='lewisethnologue2016')}">Lewis, Simons &amp; Fennig 2016</a>).
    The Hindu Kush,
    in this sense, is part of the territories of several countries -- primarily Afghanistan, Pakistan and India. The
    geographically most salient feature is its mountainous environment, especially vis-à-vis the Indo-Gangetic plains
    situated south of it. While being a transit zone of sorts between the cultural spheres of South Asia, Central Asia,
    West Asia and the Himalayas, this is simultaneously the easternmost extension of Iranian languages, the northernmost
    extension of Indo-Aryan languages as well as the westernmost extension of Sino-Tibetan.
    Apart from those three phylogenetic components, the region is also home to Nuristani, at least two Turkic
    language enclaves and the language isolate Burushaski. These six major phylogenies of the linguistic landscape of
    the Hindu Kush will be introduced briefly.
</p>

<div id="map-container">
    ${(map_ or request.map).render()}
</div>

<p>
    <b>Indo-Aryan</b> (which along with Iranian and Nuristani belongs to the larger Indo-Iranian
    branch of Indo-European) is
    the largest phylogenetic component, making up at least half of the languages in the Hindu Kush region, relatively
    evenly distributed in a southern belt stretching from east to west. Those can be grouped into at least nine
    relatedness clusters or groups (Pashai, Kunar, Chitral, Kohistani, Shina, Kashmiri, Western Punjabi, Rajasthani, and
    Central), although the exact placement of a few of them remains uncertain
    (<a href="${req.route_url('source', id='strandnotes1973')}">Strand 1973: 207–208</a>;
    <a href="${req.route_url('source', id='strandtongues2001')}">2001: 251</a>;
    <a href="${req.route_url('source', id='bashirdardic2003')}">Bashir 2003</a>).
    In the past, the label “Dardic” was collectively applied to languages belonging to the six first-mentioned
    groups, all of them Northwestern Indo-Aryan languages, with a longstanding presence in the region. That label is,
    however, no longer relevant as a classificatory entity
    (<a href="${req.route_url('source', id='morgenstiernedardic1961')}">Morgenstierne 1961</a>).
    The region’s Western Punjabi
    varieties (such as Pahari-Pothwari and Hindko) are really part of a larger Punjabi continuum with an extension far
    south of the region, and as such probably have more in common with the closest main Indo-Aryan languages of the
    Indo-Pakistani plains than with most of the other Indo-Aryan varieties in the region. Gojri (Rajasthani) is the
    language of nomadic or semi-nomadic Gujurs, today a language spoken in pockets throughout the region and beyond, with a
    significant concentration in Kashmir, whereas its closest Rajasthani relatives are found at a considerable distance,
    deep into the main belt of Indo-Aryan
    (<a href="${req.route_url('source', id='sharmagojri2002')}">Sharma 2002: 44–45</a>).
    Domaaki (Central) is a relative newcomer to the
    region. As the language of a small enclave of musicians and blacksmiths, it has during its 200-300 years in the area
    acquired a number of features typical of neighbouring and locally dominant languages
    (<a href="${req.route_url('source', id='weinreichdomaaki2011')}">Weinreich 2011: 165–166</a>).
    Like Gojri, its closest relatives are to be found in the plains of North India.
</p>
<p>
    <b>Iranian</b> is the second largest component, if counted in number of distinct language varieties. Most of those
    languages are spoken in the western half of the region, primarily in Afghanistan, but also in Pakistan and in
    adjacent areas of Tajikistan and China. A number of them are spoken next to Indo-Aryan languages, and patterns of
    bilingualism involving Indo-Aryan and Iranian alike have most likely existed for a prolonged period. While the
    various varieties and sub-varieties of Dari (Afghan Persian) or Tajik that are spoken in the region are considered
    Western Iranian, all the other Iranian language varieties represented here are Eastern
    (<a href="${req.route_url('source', id='schmittmodern1989')}">Skjaervø 1989: 370</a>).
    Pashto, the
    numerically dominant of those and also the geographically most wide-spread, is distantly related to the so-called
    “Pamiri” languages, a relatively loose cluster of Iranian languages primarily spoken in the Pamirs and surrounding
    areas
    (<a href="${req.route_url('source', id='schmittpamir1989')}">Payne 1989: 417</a>;
    <a href="${req.route_url('source', id='edelmanpamir2009')}">Èdel’man &amp; Dodykhudoeva 2009: 773</a>).
    While Parachi, a small language community in the
    southwestern part of the Hindu Kush region, in general terms also belong to East Iranian, and more specifically to a
    south-eastern subgroup, the classification of this language poses problems of a particular kind, as there are
    features revealing deep historical affinities with Northwestern Iranian
    (<a href="${req.route_url('source', id='schmittmodern1989')}">Skjaervø 1989: 370</a>;
    <a href="${req.route_url('source', id='kiefferparachi2009')}">Kieffer 2009: 693</a>;
    <a href="${req.route_url('source', id='morgenstiernereport1926')}">Morgenstierne 1926: 27–28</a>).
    Parachi is only closely related to one other Iranian language, namely Ormuri, a small linguistic island
    surrounded by Pashto in Pakistan’s Waziristan area.
</p>

<p>
    <b>Nuristani</b> is spoken in a system of remote valleys in a confined area of northeastern Afghanistan, with some
    minor spill-over into adjacent areas of Pakistan. This group, with its 5-6 languages, forms a third, albeit
    numerically minimal, branch of Indo-Iranian
    (<a href="${req.route_url('source', id='strandnotes1973')}">Strand 1973: 297–298</a>;
    <a href="${req.route_url('source', id='morgenstiernedardic1961')}">Morgenstierne 1961: 139</a>).
    While it is neither
    Iranian nor Indo-Aryan, the historical and interactional relationship between the neighbouring Indo-Aryan
    communities and the Nuristani communities is complex and far from straight-forward and the exact point at which
    Nuristani branched off from the rest of Indo-Iranian is a far from settled issue
    (<a href="${req.route_url('source', id='simswilliamsnuristani2002')}">Degener 2002</a>;
    <a href="${req.route_url('source', id='zollergrammar2005')}">Zoller 2005: 10–15</a>).
    Nuristani can be further sub-classified into a northern and a southern group
    (<a href="${req.route_url('source', id='strandtongues2001')}">Strand 2001: 258–259</a>;
    <a href="${req.route_url('source', id='buddrussmaterialien2017')}">Buddruss &amp; Degener 2017: 13</a>).
</p>

<p>
    <b>Sino-Tibetan</b> is present in the eastern-most part of the Hindu Kush region
    (as
    defined above), in Pakistan’s Baltistan and in Ladakh on the Indian side of the so-called Line-Of-Control. The 3-4
    varieties represented are all part of a Western Tibetic grouping and forms the geographic westernmost fringe of a
    phylogenetic entity comprising hundreds of languages spoken throughout the highlands of South East Asia and beyond. The two
    with one another closely related language varieties Balti and Purik are in comparison with Tibetan in general
    considered particularly archaic
    (<a href="${req.route_url('source', id='bielmeiermarchen1985')}">Bielmeier 1985: 14–15</a>),
    but give at the same time evidence of developments
    resulting from intensive contact with neighbouring Indo-Aryan languages
    (<a href="${req.route_url('source', id='brayposition2005')}">Zeisler 2005: 57</a>).
</p>

<p>
    <b>Turkic</b> is represented by two Turkic language enclaves with a relatively stable presence in the northernmost
    part of
    the region: Kyrgyz, in the far-flung highlands of the Wakhan corridor, where it is spoken by herdsmen; and Uzbek in
    Afghan Badakhshan. Those languages belong to two separate branches of Turkic, Kipchak
    (<a href="${req.route_url('source', id='kirchnerkirghiz1998')}">Kirchner 1998: 344</a>),
    and Uyhgur-Karluk
    (<a href="${req.route_url('source', id='johansonuzbek2006')}">Johanson 2006: 287–288</a>;
    <a href="${req.route_url('source', id='boeschotenuzbek1998')}">Boeschoten 1998: 357</a>),
    respectively. The southern sub-variety of Uzbek that
    is spoken in the region displays a great deal of interference from Iranian languages
    (<a href="${req.route_url('source', id='reichlsyntactic1983')}">Reichl 1983: 31</a>).
</p>

<p>
    <b>Burushaski</b>, finally, is for all practical purposes still best considered a language isolate, although having
    been
    the subject of numerous attempts at tying it to various families of the world, such as Indo-European
    (<a href="${req.route_url('source', id='casuleburushaski2009')}">Čašule 2009</a>),
    Yeniseian in Siberia
    (<a href="${req.route_url('source', id='toporovburushaski1971')}">Toporov 1971</a>)
    and some of the language families in the Caucasus
    (<a href="${req.route_url('source', id='holstherkunft2017')}">Holst 2017</a>).
    The
    presence of the language in this particular region is without doubt of a very old age, possibly surpassing most of
    the languages or phyla mentioned above, and there is reason to believe that it once had a considerably larger
    geographical distribution
    (<a href="${req.route_url('source', id='tikkanenburushaski1988')}">Tikkanen 1988: 305</a>).
    Many of the surrounding languages have left traces, not the least
    in its lexicon
    (<a href="${req.route_url('source', id='bergerburushaskisprache1998')}">Berger 1998: 3</a>),
    and there is considerable convergence between Burushaski and quite a few of the
    neighbouring languages, whether Indo-Aryan, Iranian or Tibetan
    (<a href="${req.route_url('source', id='tikkanenburushaski1988')}">Tikkanen 1988: 310</a>;
    <a href="${req.route_url('source', id='hocknorthwest2015')}">Hock 2015: 128</a>).
    Today, it is
    spoken by less than 100,000 people in the extreme North of Pakistan, close to the border of China.
</p>

<p>
    The linguistic profile of this region and its significance as a contact zone or linguistic area has been the topic
    of a discussion going on for several decades
    (<a href="${req.route_url('source', id='toporovabout1970')}">Toporov 1970</a>;
    <a href="${req.route_url('source', id='edelmank1980')}">Èdel’man 1980</a>;
    <a href="${req.route_url('source', id='edelmandardic1983')}">1983: 16</a>;
    <a href="${req.route_url('source', id='fussmanatlas1972')}">Fussman 1972: 389–399</a>;
    <a href="${req.route_url('source', id='bashirmosaic1996')}">Bashir 1996a</a>;
    <a href="${req.route_url('source', id='bashirareal1996')}">1996b</a>;
    <a href="${req.route_url('source', id='bashirdardic2003')}">2003: 823</a>;
    <a href="${req.route_url('source', id='hockhanshenrichpre19472016')}">2016</a>;
    <a href="${req.route_url('source', id='baarttone2014')}">Baart 2014</a>;
    <a href="${req.route_url('source', id='blencharchaeologicallinguistic1999')}">Tikkanen 1999</a>;
    <a href="${req.route_url('source', id='tikkanenareal2008')}">2008</a>;
    <a href="${req.route_url('source', id='liljegrenprofiling2017')}">Liljegren 2017</a>;
    <a href="${req.route_url('source', id='koptjevskajatammsemantic2017')}">Koptjevskaja-Tamm &amp;
        Liljegren
        2017: 215–223</a>;
    <a href="${req.route_url('source', id='emeneauindia1965')}">Emeneau 1965</a>;
    <a href="${req.route_url('source', id='skalmowskilinguistic1985')}">Skalmowski 1985</a>;
    <a href="${req.route_url('source', id='masicaindoaryan1991')}">Masica 1991: 43</a>;
    <a href="${req.route_url('source', id='masicadefinition2001')}">2001: 259</a>),
    but the tendency has been to focus on
    individual features and phenomena, sometimes based on relatively sparse data, and more seldom have there been
    attempts at applying a higher degree of feature aggregation with tight sampling.
</p>

<p>
    In the present study, we collected and analyzed comparable primary data from a very tight sample of 59 Hindu
    Kush-Karakoram language varieties (for practical reasons limited to Afghanistan, Pakistan and India). All the six
    phylogenies referred to above were represented, as were most of the relevant subgroupings. For some of the languages spoken across
    international borders we aimed at representing such a language as used in these different countries. Unfortunate
    circumstances and a tight schedule made it impossible to collect data from a few languages that were initially
    targeted, such as Domaaki (Indo-Aryan), Chilisso (Indo-Aryan), Pothwari-Pahari as spoken in Kashmir (Indo-Aryan),
    Poguli Kashmiri (Indo-Aryan), and Tregami (Nuristani). A few other languages previously listed for the region are
    most likely moribund or spoken by only a few individuals, such as Tirahi (Indo-Aryan), Grangali (Indo-Aryan), Shumashti (Indo-Aryan),
    and Gowro (Indo-Aryan)
</p>

<p>
    The data collected allowed for setting up a basic word list of comparable meanings (representing kinship, numerals,
    basic actions, substances and objects) as well as for classifying each variety according to a number of binary
    structural features (reflecting phonological, morphological, syntactic and lexico-semantic properties). As is
    expanded on in publications yet to appear, a comparison of the basic lexicon across theses languages lines up closely
    with established phylogenetic classification, whereas clustering of structural similarity is clearly related to
    geographical proximity within the region and often cuts across phylogenetic boundaries. The strongest evidence of
    areality tied to the region itself (vis-à-vis South Asia in general on the one hand and Central/West Asia on the
    other) relates to phonology and lexical structure, whereas word order and alignment features mostly place the
    region’s languages within larger areal or macro-areal distributions. Some morphological properties related to
    grammatical categorization (e.g. gender) display a high degree of genetic stability.
</p>

<div id="table-container">
    ${ctx.render()}
</div>
