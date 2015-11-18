<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/customer">
    <content tag="details">
        <h3>Entree</h3>

        <div class="drink-table">
            <table class="table table-striped">
                <tbody data-bind="foreach: ${entrees}">
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

                            <div class="col-xs-6">
                                <a class="btn btn-success" data-bind="click: $parent.add">Add</a>
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
                                    <b>Price:</b> <span data-bind="text: $data.price"></span>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <h3>Side</h3>

        <div class="drink-table">
            <table class="table table-striped">
                <tbody data-bind="foreach: ${sides}">
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

                            <div class="col-xs-6">
                                <a class="btn btn-success" data-bind="click: $parent.add">Add</a>
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
                                    <b>Price:</b> <span data-bind="text: $data.price"></span>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <h3>Dessert</h3>

        <div class="drink-table">
            <table class="table table-striped">
                <tbody data-bind="foreach: ${desserts}">
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

                            <div class="col-xs-6">
                                <a class="btn btn-success" data-bind="click: $parent.add">Add</a>
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
                                    <b>Price:</b> <span data-bind="text: $data.price"></span>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </content>
</g:applyLayout>
</body>
</html>