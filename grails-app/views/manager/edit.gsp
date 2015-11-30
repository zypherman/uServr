<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>The Manager</title>
</head>

<body>
<g:applyLayout name="pages/manager">
    <content tag="details">
        <h1 class="edit-top">Add Menu Item</h1>
        <div class="row">
            <div class="col-xs-2">
                <button class="btn btn-info" data-bind="click: addFood">Food</button>
            </div>
            <div class="col-xs-2">
                <button class="btn btn-info" data-bind="click: addDrink">Drink</button>
            </div>
        </div>
        <div class="edit-form" data-bind="visible: isEditing">
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" placeholder="Name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="description" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10">
                        <input type="text" name="description" class="form-control" id="description" placeholder="Description">
                    </div>
                </div>
                <div class="form-group">
                    <label for="price" class="col-sm-2 control-label">Price</label>
                    <div class="col-sm-10">
                        <input type="text" name="price" class="form-control" id="price" placeholder="Price">
                    </div>
                </div>
                <!-- ko if: drink -->
                <div class="form-group">
                    <label for="size" class="col-sm-2 control-label">Size</label>
                    <div class="col-sm-10">
                        <input type="text" name="size" class="form-control" id="size" placeholder="Size">
                    </div>
                </div>
                <div class="form-group">
                    <label for="pour" class="col-sm-2 control-label">Pour</label>
                    <div class="col-sm-10">
                        <input type="text" name="pour" class="form-control" id="pour" placeholder="Pour">
                    </div>
                </div>
                <div class="form-group">
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="bar" value="bar">
                            Bar
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="non-alcohol" value="non-alcohol">
                            Non-Alcohol
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <g:actionSubmit class="btn btn-success" value="Add Drink" action="addDrink"/>
                    </div>
                </div>
                <!-- /ko -->
                <!-- ko if: food -->
                <div class="form-group">
                    <label for="options" class="col-sm-2 control-label">Options</label>
                    <div class="col-sm-10">
                        <input type="text" name="options" class="form-control" id="options" placeholder="Options">
                    </div>
                </div>
                <div class="form-group">
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="entree" value="entree">
                            Entree
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="side" value="side">
                            Side
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="dessert" value="dessert">
                            Dessert
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <g:actionSubmit class="btn btn-success" value="Add Food" action="addFood"/>
                    </div>
                </div>
                <!-- /ko -->
            </form>
        </div>
        <h1>Edit Menu Item</h1>
        <div class="edit-form" data-bind="visible: found">
            <form class="form-horizontal edit-form-submit">
                <div class="form-group">
                    <label for="edit-name" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="edit-name" data-bind="value: name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit-description" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10">
                        <input type="text" name="description" class="form-control" id="edit-description" data-bind="value: description">
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit-price" class="col-sm-2 control-label">Price</label>
                    <div class="col-sm-10">
                        <input type="text" name="price" class="form-control" id="edit-price" data-bind="value: price">
                    </div>
                </div>
                <!-- ko if: editDrink -->
                <div class="form-group">
                    <label for="edit-size" class="col-sm-2 control-label">Size</label>
                    <div class="col-sm-10">
                        <input type="text" name="size" class="form-control" id="edit-size" data-bind="value: size">
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit-pour" class="col-sm-2 control-label">Pour</label>
                    <div class="col-sm-10">
                        <input type="text" name="pour" class="form-control" id="edit-pour" data-bind="value: pour">
                    </div>
                </div>
                <div class="form-group">
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="edit-bar" value="bar">
                            Bar
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="edit-non-alcohol" value="non-alcohol">
                            Non-Alcohol
                        </label>
                    </div>
                </div>
                <!-- /ko -->
                <!-- ko if: editFood -->
                <div class="form-group">
                    <label for="edit-options" class="col-sm-2 control-label">Options</label>
                    <div class="col-sm-10">
                        <input type="text" name="options" class="form-control" id="edit-options" data-bind="value: options">
                    </div>
                </div>
                <div class="form-group">
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="edit-entree" value="entree">
                            Entree
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="edit-side" value="side">
                            Side
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="cat" id="edit-dessert" value="dessert">
                            Dessert
                        </label>
                    </div>
                </div>
                <!-- /ko -->
                <div class="form-group form-buttons">
                    <div class="col-sm-4">
                        <g:actionSubmit class="btn btn-warning" value="Cancel" data-bind="click: cancel"/>
                    </div>
                    <div class="col-sm-4">
                        <g:actionSubmit class="btn btn-danger" value="Delete" data-bind="click: remove"/>
                    </div>
                    <div class="col-sm-4">
                        <g:actionSubmit class="btn btn-success" value="Save" data-bind="click: save"/>
                    </div>
                </div>
            </form>
        </div>
        <div class="edit-form" data-bind="visible: !found()">
            <div class="alert alert-danger" role="alert" data-bind="visible: notFound">Item Not Found.</div>
            <div class="alert alert-success" role="alert" data-bind="visible: success, text: sMessage"></div>
            <form class="form-horizontal find">
                <div class="form-group">
                    <label for="editName" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" name="editName" class="form-control" id="editName" placeholder="Name">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-warning" data-bind="click: find">Find</button>
                    </div>
                </div>
            </form>
        </div>
    </content>
</g:applyLayout>
</body>
</html>