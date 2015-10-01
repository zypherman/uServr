<div class="row">
    <div class="col-sm-3">
        <g:render template="/templates/leftNav" model="[name: 'User Dash']"/>
    </div>

    <div class="col-sm-6">
        <g:pageProperty name="page.details"/>
        <g:pageProperty name="page.templates"/>
    </div>

    <div class="col-sm-3">
        <g:render template="/templates/orderModule"/>
    </div>
</div>

<g:pageProperty name="page.scripts"/>

<g:javascript src="user/userViewModel.js"/>