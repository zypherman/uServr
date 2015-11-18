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
                  model="[name : 'Uservr',
                          links: [[controller: 'customer', action: 'index', name: 'Customer'],
                                  [controller: 'manager', action: 'index', name: 'Manager'],
                                  [controller: 'bar', action: 'index', name: 'Bar'],
                                  [controller: 'kitchen', action: 'index', name: 'Kitchen']]]"/>
    </div>

    <div class="col-sm-9">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="text-center">
                        <h1>Welcome to Uservr</h1>

                        <div>
                            <p>Welcome to uServr! Feel free to take a look at our menu right away or our featured menu items!</p>

                            <p>When you are ready to order add the items to your order and click send order!</p>
                        </div>

                    </div>
                </div>

                <div class="item">
                    <div class="text-center"><h1>Featured Items</h1></div>
                    <div>
                        <g:render template="/templates/menuItems"/>
                    </div>
                </div>

                <div class="item">
                    <div class="text-center"><h1>Cool</h1></div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            </a>
        </div>

    </div>
</div>

</body>
</html>