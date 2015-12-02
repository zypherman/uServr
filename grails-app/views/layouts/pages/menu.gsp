<div class="row">
    <div class="col-sm-3">
        <g:render template="/templates/leftNav"
                  model="[name : message(code: 'your'),
                          links: [[controller: 'customer', action: 'index', name: message(code: 'cHome')],
                                  [controller: 'customer', action: 'drink', name: message(code: 'drink')],
                                  [controller: 'customer', action: 'food', name: message(code: 'food')]]]"/>
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

