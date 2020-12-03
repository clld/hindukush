<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "parameters" %>
<%block name="title">${_('Parameter')} ${ctx.name}</%block>




% if ctx.contribution.module == 'StructureDataset':
    <h2>Feature ${ctx.name}</h2>
    <div class="span8">
        % if ctx.description:
            ${u.fix_description(ctx.description, req)|n}
        % endif
    </div>
<div class="well well-small span3">
    <h4>Values</h4>
    <table class="table table-nonfluid">
        <tbody>
            % for de in ctx.domain:
                <tr>
                    <td>${h.map_marker_img(req, de)}</td>
                    <td>${de.description}</td>
                    <td class="right">${len(de.values)}</td>
                </tr>
            % endfor
        </tbody>
    </table>
</div>
% else:
    <h2>Concept ${ctx.name}</h2>
% endif


<div style="clear: both"/>
% if map_ or request.map:
${(map_ or request.map).render()}
% endif

${request.get_datatable('values', h.models.Value, parameter=ctx).render()}
