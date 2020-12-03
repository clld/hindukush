<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "languages" %>
<%block name="title">${_('Language')} ${ctx.name}</%block>

<h2>${_('Language')} ${ctx.name}</h2>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#StructureDataset" data-toggle="tab">Features</a></li>
        <li><a href="#Wordlist" data-toggle="tab">Lexicon</a></li>
    </ul>
    <div class="tab-content" style="overflow: visible;">
        <div id="StructureDataset" class="tab-pane active">
            ${request.get_datatable('values', h.models.Value, language=ctx, module='StructureDataset').render()}
        </div>
        <div id="Wordlist" class="tab-pane">
            <div class="alert alert-info">
                <a class="btn" href="#" id="playButton"><i class="icon-play" onclick="HINDUKUSH.play()"> </i></a> play all audio
            </div>
            ${request.get_datatable('values', h.models.Value, language=ctx, module='Wordlist').render()}
        </div>
    </div>
    <script>
$(document).ready(function() {
    if (location.hash !== '') {
        $('a[href="#' + location.hash.substr(2) + '"]').tab('show');
    }
    return $('a[data-toggle="tab"]').on('shown', function(e) {
        return location.hash = 't' + $(e.target).attr('href').substr(1);
    });
});
    </script>
</div>

<%def name="sidebar()">
    ${util.language_meta()}
</%def>
