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

    <div class="col-sm-9">
        <div class="row">
            <h1 class="text-center">Welcome to uServr</h1>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled
                it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining
                essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with
                desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Featured Items</h1>
                <g:render template="/templates/menuItems"/>
            </div>
        </div>
    </div>
</div>

</body>
</html>