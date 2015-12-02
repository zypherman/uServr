<div class="row">
    <div class="col-sm-3">
        <g:render template="/templates/leftNav"
                  model="[name : message(code: 'mDash'),
                          links: [[controller: 'manager', action: 'index', name: message(code: 'mHome')],
                                  [controller: 'manager', action: 'edit', name: message(code: 'editMenu')]]]"/>
    </div>

    <div class="col-sm-9">
        <g:pageProperty name="page.details"/>
        <g:pageProperty name="page.templates"/>
    </div>
</div>

<g:pageProperty name="page.scripts"/>

<g:javascript src="manager/managerViewModel.js"/>