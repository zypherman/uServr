<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/customer">
    <content tag="details">
        <div class="row">
            <div class="col-sm-6">
                <a class=" btn btn-default" href="/customer/drink">Drink</a>
            </div>
            <div class="col-sm-6">
                <g:submitButton name="food" value="Food"/>
            </div>
        </div>
    </content>
</g:applyLayout>
</body>
</html>