<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>The Manager</title>
</head>

<body>
<g:applyLayout name="pages/manager">
    <content tag="details">
        <h1>The Manager</h1>
        <div class="row">
            <div class="col-sm-6">
                <h3>Food Menu</h3>
                <div class="manager-table">
                    <h5>Entree</h5>
                    <div class="drink-table">
                        <table class="table table-striped">
                            <tbody data-bind="foreach: ${foodViewModel}">
                            <!-- ko if: cat == 'entree' -->
                            <tr>
                                <td>
                                    <span data-bind="text: $data.name"></span>
                                </td>
                                <td>
                                    <div class="row bar-buttons">
                                        <div class="col-xs-6">
                                            <button class="btn btn-info"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-bind="attr: {'data-target': '#food' + $index()}">info</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div class="collapse" data-bind="attr: {id: 'food' + $index()}">
                                        <div class="well">
                                            <div>
                                                <b>Description:</b> <span data-bind="text: $data.description"></span>
                                            </div>

                                            <div>
                                                <b>Price:</b> <span data-bind="text: $data.price"></span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- /ko -->
                            </tbody>
                        </table>
                    </div>
                    <h5>Side</h5>

                    <div class="drink-table">
                        <table class="table table-striped">
                            <tbody data-bind="foreach: ${foodViewModel}">
                            <!-- ko if: cat == 'side' -->
                            <tr>
                                <td>
                                    <span data-bind="text: $data.name"></span>
                                </td>
                                <td>
                                    <div class="row bar-buttons">
                                        <div class="col-xs-6">
                                            <button class="btn btn-info"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-bind="attr: {'data-target': '#food' + $index()}">info</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div class="collapse" data-bind="attr: {id: 'food' + $index()}">
                                        <div class="well">
                                            <div>
                                                <b>Description:</b> <span data-bind="text: $data.description"></span>
                                            </div>

                                            <div>
                                                <b>Price:</b> <span data-bind="text: $data.price"></span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- /ko -->
                            </tbody>
                        </table>
                    </div>
                    <h5>Dessert</h5>

                    <div class="drink-table">
                        <table class="table table-striped">
                            <tbody data-bind="foreach: ${foodViewModel}">
                            <!-- ko if: cat == 'dessert' -->
                            <tr>
                                <td>
                                    <span data-bind="text: $data.name"></span>
                                </td>
                                <td>
                                    <div class="row bar-buttons">
                                        <div class="col-xs-6">
                                            <button class="btn btn-info"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-bind="attr: {'data-target': '#food' + $index()}">info</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div class="collapse" data-bind="attr: {id: 'food' + $index()}">
                                        <div class="well">
                                            <div>
                                                <b>Description:</b> <span data-bind="text: $data.description"></span>
                                            </div>

                                            <div>
                                                <b>Price:</b> <span data-bind="text: $data.price"></span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- /ko -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <h3>Drink Menu</h3>

                <div class="manager-table">
                <h5>Bar</h5>
                <div class="drink-table">
                    <table class="table table-striped">
                        <tbody data-bind="foreach: ${drinkViewModel}">
                        <!-- ko if: cat == 'bar' -->
                        <tr>
                            <td>
                                <span data-bind="text: $data.name"></span>
                            </td>
                            <td>
                                <div class="row bar-buttons">
                                    <div class="col-xs-6">
                                        <button class="btn btn-info"
                                                type="button"
                                                data-toggle="collapse"
                                                data-bind="attr: {'data-target': '#' + $index()}">info</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="collapse" data-bind="attr: {id: $index}">
                                    <div class="well">
                                        <div>
                                            <b>Description:</b> <span data-bind="text: $data.description"></span>
                                        </div>

                                        <div>
                                            <b>Size:</b> <span data-bind="text: $data.size"></span>
                                        </div>

                                        <div>
                                            <b>Pour:</b> <span data-bind="text: $data.pour"></span>
                                        </div>

                                        <div>
                                            <b>Price:</b> <span data-bind="text: $data.price"></span>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!-- /ko -->
                        </tbody>
                    </table>
                </div>

                <h5>Non-Alcohol</h5>

                <div class="drink-table">
                    <table class="table table-striped">
                        <tbody data-bind="foreach: ${drinkViewModel}">
                        <!-- ko if: cat == 'non-alcohol' -->
                        <tr>
                            <td>
                                <span data-bind="text: $data.name"></span>
                            </td>
                            <td>
                                <div class="row bar-buttons">
                                    <div class="col-xs-6">
                                        <button class="btn btn-info"
                                                type="button"
                                                data-toggle="collapse"
                                                data-bind="attr: {'data-target': '#' + $index()}">info</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="collapse" data-bind="attr: {id: $index}">
                                    <div class="well">
                                        <div>
                                            <b>Description:</b> <span data-bind="text: $data.description"></span>
                                        </div>

                                        <div>
                                            <b>Size:</b> <span data-bind="text: $data.size"></span>
                                        </div>

                                        <div>
                                            <b>Pour:</b> <span data-bind="text: $data.pour"></span>
                                        </div>

                                        <div>
                                            <b>Price:</b> <span data-bind="text: $data.price"></span>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!-- /ko -->
                        </tbody>
                    </table>
                </div>
                    </div>
            </div>
        </div>
        <div>
            <h3>Order History</h3>
            <table class="table table-stripped">
                <tr>
                    <th>Name</th>
                    <th>Count</th>
                    <th>Sales</th>
                </tr>
                <tbody data-bind="foreach: ${orderHistoryViewModel}">
                    <tr>
                        <td data-bind="text: $data.menuItem.name"></td>
                        <td data-bind="text: $data.count"></td>
                        <td>$<span data-bind="text: $data.sales"></span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </content>
</g:applyLayout>
</body>
</html>