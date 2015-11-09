<div class="row">
    <div class="col-sm-3">
        <g:render template="/templates/leftNav"
                  model="[name : 'Your Dash',
                          links: [[controller: 'customer', action: 'index', name: 'Customer Home'],
                                  [controller: 'customer', action: 'drink', name: 'Drink'],
                                  [controller: 'customer', action: 'food', name: 'Food']]]"/>
    </div>

    <div class="col-sm-6">
        <g:pageProperty name="page.details"/>
        <g:pageProperty name="page.templates"/>
        %{--<g:render template="/templates/addCreditCard"/>--}%
    </div>

    <div class="col-sm-3">
        <g:render template="/templates/orderModule"/>
        <g:render template="/templates/registerCustomer"/>
    </div>
</div>

<g:pageProperty name="page.scripts"/>

<g:javascript src="user/userViewModel.js"/>