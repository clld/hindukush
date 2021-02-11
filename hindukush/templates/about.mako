<%inherit file="hindukush.mako"/>
<%namespace name="util" file="util.mako"/>
<%! active_menu_item = "about" %>
<%! multirow = True %>

<div class="row-fluid">
    <div class="span12">
        <h2>About</h2>
        <ul>
            <li><a href="#team">Team and collaboration</a></li>
            <li><a href="#project">Project design and data collection</a></li>
            <li><a href="#credits">Acknowledgements</a></li>
        </ul>

            <%util:section title="Team and collaboration" level="3" id="team">
            <p>
                As the Principal Investigator, Henrik Liljegren was responsible for the overall project coordination and
                implementation, but a large number of people and groups contributed in crucial ways to the project and
                to this database. The main part of systematic data annotation, processing and analysis took place at
                Stockholm University. Noa Lange was employed as a research assistant, primarily working with IPA
                transcription, various types of data processing and ELAN annotation. Initially as part of a project
                internship, and later as a research assistant, Nina Knobloch fine-tuned data and prepared the output of
                structural analysis and set up a first version of a web interface. Robert Forkel prepared the final
                structure and output of the present application.
            </p>
        </%util:section>
    </div>
</div>

<div class="row-fluid">
    <div class="span4">
        <figure>
            <img class="img-polaroid" src="${req.static_url('hindukush:static/04_HenrikLiljegren.jpg')}" width="80%">
            <figcaption>
                Henrik Liljegren, PI
            </figcaption>
        </figure>
    </div>
    <div class="span4">
        <figure>
            <img class="img-polaroid" src="${req.static_url('hindukush:static/07_NoaLange.jpg')}" width="80%">
            <figcaption>
                Noa Lange, Research Assistant
            </figcaption>
        </figure>
    </div>
    <div class="span4">
        <figure>
            <img class="img-polaroid" src="${req.static_url('hindukush:static/06_NinaKnobloch.jpg')}" width="80%">
            <figcaption>
                Nina Knobloch, Project Intern/Research Assistant
            </figcaption>
        </figure>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <p>
            As part of the data collection process (see below for details on the data set), six collaborative
            elicitation workshops were arranged under the auspices of three different institutions based in the Hindu
            Kush region. The PI was present and coordinated the elicitation during all of these sessions.
        </p>
        <p>
            Forum for Language Initiatives (FLI), Pakistan. FLI is a non-governmental organization based in Islamabad.
            It was established in 2003 to promote the many indigenous languages in Pakistan’s mountainous northern
            region. It functions as a resource centre for the local communities, offering training and support in the
            area of mother-tongue education, language advocacy, literature development and language documentation. Two
            collaborative elicitation workshops were held in Islamabad in October 2015 and August 2016.
        </p>
        <p>
            Samar, Afghanistan. Samar is a non-governmental organization. It was established in 2009 and functions as a
            resource centre for language communities throughout Afghanistan, offering training and support in the area
            of mother-tongue education, literature development and language documentation. Two collaborative elicitation
            workshops were held in Kabul and one in Faizabad in April 2017.
        </p>
        <p>
            Department of Linguistics, University of Kashmir, India. The department hosts a handful of linguistic
            scholars and some 20 Ph.D. students, many of whom are dedicated to the documentation and description of
            linguistic diversity and multilingualism in Jammu & Kashmir, a union territory in northern-most India. One
            collaborative elicitation workshop was held in Srinagar in April/May 2018.
        </p>
        <p>
            The contributions of those institutions were primarily in providing logistic support and work space,
            identifying and recruiting language consultants, co-facilitating workshop sessions with the PI, and
            assisting in e.g. audio or video recording. In some cases, staff members or students were instrumental in
            translating elicitation material and in digitizing materials (translations, transcriptions or glosses)
            produced non-digitally by participating language consultants.
        </p>
        <p>
            In addition to the collaborative workshops, a few individual language elicitation sessions were arranged in
            Islamabad (Pakistan) in August 2016, in Gilgit in August 2016 (Pakistan), and in May 2018 in Kargil (India).
        </p>
    </div>
</div>

<div class="row-fluid">
    <div class="span6">
        <figure>
            <img class="img-polaroid" src="${req.static_url('hindukush:static/08_SrinagarWorkshop.JPG')}" width="100%">
            <figcaption>
                Collaborative elicitation workshop in Srinagar (India), April/May 2018: Afreen Nazir (Kashmiri), Mohd
                Mustafa (Purik)
            </figcaption>
        </figure>
    </div>
    <div class="span6">
        <figure>
            <img class="img-polaroid" src="${req.static_url('hindukush:static/02_FaizabadWorkshop.JPG')}" width="100%">
            <figcaption>
                Collaborative elicitation workshop in Faizabad (Afghanistan), April 2017
            </figcaption>
        </figure>
    </div>
</div>
<div class="row-fluid">
    <div class="span6">
        <figure>
            <img class="img-polaroid" src="${req.static_url('hindukush:static/05_IslamabadWorkshop.JPG')}" width="100%">
            <figcaption>
                Collaborative elicitation workshop in Islamabad (Pakistan), August 2016: Shahid ur Rehman (Gojri), Raja
                Hasrat Khan (Hindko), Ghulam Rauf Qurashi (Kundal Shahi), Dr. Uzma Anjum (Pothwari), Luke Rehmat
                (Kalasha)
            </figcaption>
        </figure>
    </div>
    <div class="span6">
        <figure>
            <img class="img-polaroid" src="${req.static_url('hindukush:static/03_GilgitElicitation.JPG')}" width="100%">
            <figcaption>
                Individual elicitation in Gilgit (Pakistan), August 2016: Aejaz Karim (Wakhi)
            </figcaption>
        </figure>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <p>
            Totally 79 native consultants, representing <a href="${req.route_url('languages')}">59 language varieties</a>,
            participated
            in the elicitation workshops/sessions. These individuals offered plenty of linguistic and sociolinguistic
            insights in interaction with the PI and with other participants, and contributed language data in audio and
            video recording as well as through writing. To the extent they were able, the consultants made draft (mainly
            non-IPA) transcriptions, translated portions of text into a language of wider communication, and provided
            word glosses.
        </p>
        <p>
            A number of students at the Department of Linguistics, Stockholm University, have carried out thesis work
            related to the project under the supervision of the PI: Andrew Gomes, Nina Knobloch, Richard Kowalik, Noa
            Lange, Julia Lautin, Jane Ogawa, Vanessa Quasnik, Hanna (Kjellberg) Rönnqvist and Jacqueline Venetz. Those
            can be accessed in the digital archive of DiVA (Digitala Vetenskapliga Arkivet):
            A number of students at the Department of Linguistics, Stockholm University, have carried out thesis work
            related to the project under the supervision of the PI: Andrew Gomes, Nina Knobloch, Richard Kowalik, Noa
            Lange, Julia Lautin, Jane Ogawa, Vanessa Quasnik, Hanna (Kjellberg) Rönnqvist and Jacqueline Venetz. Those
            theses can be accessed in the digital archive of DiVA (Digitala Vetenskapliga Arkivet):
            <a href="https://su.diva-portal.org">su.diva-portal.org</a>.
        </p>
    </div>
</div>

<%util:section title="Project design and data collection" level="3" id="project">
    <p>
        With minor exceptions, the dataset collected in each language consisted of seven components: three word lists,
        a sentence questionnaire, a translated parallel text, context-elicited demonstrative expressions, and a
        stimulus-based narrative. Apart from the elicitation materials and instructions in English, translations were
        made available in three major lingua francas: Urdu, Dari and Pashto.
    </p>
    <table class="table">
        <thead>
        <tr>
            <th>Data component</th>
            <th>Description</th>
            <th>Recorded form</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><a href="${req.route_url('contribution', id='Wordlist', _query=dict(sSearch_2='ASJPlist'))}">40-list [40list]</a>
            </td>
            <td>Word list including the 40 basic vocabulary items used by ASJP
                <a href="${req.route_url('source', id='wichmann_asjp_2018')}">(Wichmann, Holman & Brown 2016)</a>
            </td>
            <td>Written (mostly Arabic-based)+audio</td>
        </tr>
        <tr>
            <td><a href="${req.route_url('contribution', id='Wordlist', _query=dict(sSearch_2='Kinship'))}">Kinship [Kin]</a>
            </td>
            <td>Word list including 95 kin relations, designed by the PI</td>
            <td>Written+audio</td>
        </tr>
        <tr>
            <td>
                <a href="${req.route_url('contribution', id='Wordlist', _query=dict(sSearch_2='Numerals'))}">Numerals [Num]</a>
            </td>
            <td>Word list including the cardinal numerals 1-50, 60, 70, 80, 90, 110, 120, 200, 1000</td>
            <td>Written+audio</td>
        </tr>
        <tr>
            <td>Valency [Val]</td>
            <td>Sentence questionnaire representing 87 verb meanings, designed by the by the
                <a href="http://valpal.info/about/project">Leipzig Valency Classes Project</a>
            </td>
            <td>Written+audio</td>
        </tr>
        <tr>
            <td>North Wind [NW]</td>
            <td>Translation of the traditional fable The North Wind and the Sun, widely used for
                illustrating the phonetics of numerous languages
                <a href="${req.route_url('source', id='international_phonetic_association_handbook_1999')}">(International Phonetic Association 1999)</a>
            </td>
            <td>Written+audio (for a subset: written+audio+video)</td>
        </tr>
        <tr>
            <td>Demonstratives [Dem]</td>
            <td>Expressions used in reference to objects situated at various distances from the speaker.
                An elicitation kit for this was designed by the PI, largely inspired and guided by
                <a href="${req.route_url('source', id='wilkins_1999_1999')}">Wilkins (1999)</a>
            </td>
            <td>Audio+video (for a subset, the consultants transcribed their own utterances based on the audio
                recordings)
            </td>
        </tr>
        <tr>
            <td>Pear Story [PS]</td>
            <td>Natural or semi-natural speech used in retelling the contents of the six-minute
                “Pear film”; see
                <a href="${req.route_url('source', id='chafe_pear_1980')}">Chafe (1980)</a> and http://pearstories.org/
            </td>
            <td>Audio+video (for most of the varieties, the consultants transcribed their own speech and provided a
                translation to a lingua franca)
            </td>
        </tr>
        </tbody>
    </table>
    <p>
        For the large majority of language varieties (53 of 59), data collection was carried out in the context of a 4-5
        days’ workshop, each involving consultants from five or more languages, in which the following procedure was
        followed: the participants were given a basic introduction to one of the components, e.g. kinship terms, (if
        applicable) they were given time to prepare themselves for recording (either individually or group-wise) by
        filling in a word list or questionnaire in whatever style they preferred, they were then invited, each in turn,
        to a (makeshift) recording studio to be audio or audio-and-video recorded, and after that a considerable amount
        of time was spent in comparing and discussing particular pieces of data among the participants. All
        consultant-produced written material was either saved electronically or photo-copied, to aid further processing.
    </p>
    <p>
        Subsequent to data collection, the material was organized, selectively transcribed (using a broad IPA
        transcription), analyzed and coded. The data set allowed for classifying each variety according to 80 binary
        structural features, as presented and detailed under Features, with the cited examples drawn from various
        components of the set. The elicitation and processing of the three wordlists generated the data under Wordlists.
        Much of the data remains to be fully annotated and is projected to become available on this site in future
        installments.
    </p>
</%util:section>

<%util:section title="Acknowledgements" level="3" id="credits">
    <p>
        This project and the generation of the present dataset would not have been possible without the generous and
        positive collaboration of the 79 language consultants that took the time to participate in data elicitation
        sessions in Afghanistan, India and Pakistan. While it is unfortunate, we have for safety reasons (particularly
        in Afghanistan) decided to let them remain anonymous (apart from people occurring in photos).
    </p>
    <p>
        We would like to extend thanks to the teams and individuals from the three collaborating institutions in the
        region. A special thanks to Fakhruddin Akhunzada, Shams Wali Khan, Amir Haider, Naseem Haider and Muhammad Zaman
        Sagar of the Forum for Language Initiatives, for recruiting consultants and arranging two successful workshops
        in Islamabad. Thank you so much, Dennis Coyle, Najib Ullah and the rest of the team at the Samar Kabul office,
        and Katja Müller, Sani Marzban, Adina Muhammad and the rest of the team at the Samar Faizabad office, for
        recruiting consultants from a number of very remote locations and for providing excellent services and
        hospitality in connection with the three workshops in Afghanistan. Many thanks to Aadil Amin Kak, Irfan ul Salam
        and other faculty members at the Department of Linguistics, University of Kashmir, for recruiting consultants
        and arranging a successful workshop in Srinagar.
    </p>
    <p>
        Thanks also go to Allauddin Torwali for digitizing materials collected in Pakistan; to Aziz Ali Dad for
        recruiting consultants and arranging several individual sessions held in Gilgit; and to Irfan ul Salam (again)
        for joining me (Henrik) on that memorable and breathtaking data collection trip to Ladakh.
    </p>
</%util:section>
