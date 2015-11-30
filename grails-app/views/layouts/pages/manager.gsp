<div class="row">
    <div class="col-sm-3">
        <g:render template="/templates/leftNav"
                  model="[name : 'Manager Dash',
                          links: [[controller: 'manager', action: 'index', name: 'Manager Home'],
                                  [controller: 'manager', action: 'edit', name: 'Edit Menu']]]"/>
    </div>

    <div class="col-sm-9">
        <g:pageProperty name="page.details"/>
        <g:pageProperty name="page.templates"/>
    </div>
</div>

<g:pageProperty name="page.scripts"/>

<g:javascript src="manager/managerViewModel.js"/>