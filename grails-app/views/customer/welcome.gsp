<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Welcome</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="row">
    <div class="col-sm-3">
        <g:render template="/templates/leftNav"
                  model="[name : 'Your Dash',
                          links: [[controller: 'customer', action: 'index', name: 'Customer Home'],
                                  [controller: 'customer', action: 'drink', name: 'Drink'],
                                  [controller: 'customer', action: 'food', name: 'Food']]]"/>
    </div>

    <div class="col-sm-8">
        <div class="row">
            <h1 class="text-center">Welcome to uServr</h1>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <p>Welcome to uServr! Feel free to take a look at our menu right away or our featured menu items!</p>
                <p>When you are ready to order add the items to your order and click send order!</p>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <h1 class="page-header">Featured Items</h1>
                <g:render template="/templates/menuItems"/>
            </div>
        </div>
    </div>

    <div class="col-md-1">
        <g:link class="btn btn-success btn-sm send-order" controller="login" action="login">Admin</g:link>
    </div>
</div>

</body>
</html>