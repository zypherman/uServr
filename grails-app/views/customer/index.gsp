<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/customer">
    <content tag="details">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">
                    Customer Home Page
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <a class="btn btn-primary" href="/customer/drink.gsp">Drink</a>
            </div>

            <div class="col-sm-6">
                <a class="btn btn-primary" href="/customer/food.gsp">Food</a>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Featured Items</h1>
                <g:render template="/templates/menuItems"/>
            </div>
        </div>
    </content>
</g:applyLayout>
</body>
</html>