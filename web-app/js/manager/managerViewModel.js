function ManagerViewModel() {

    var managerViewModel = this;
    var currentItem;

    managerViewModel.isEditing = ko.observable(false);
    managerViewModel.drink = ko.observable(false);
    managerViewModel.editDrink = ko.observable(false);
    managerViewModel.food = ko.observable(false);
    managerViewModel.editFood = ko.observable(false);
    managerViewModel.found = ko.observable(false);
    managerViewModel.notFound = ko.observable(false);
    managerViewModel.success = ko.observable(false);
    managerViewModel.sMessage = ko.observable();

    managerViewModel.name = ko.observable();
    managerViewModel.description = ko.observable();
    managerViewModel.price = ko.observable();
    managerViewModel.size = ko.observable();
    managerViewModel.pour = ko.observable();
    managerViewModel.options = ko.observable();
    managerViewModel.bar = ko.observable(true);
    managerViewModel.non = ko.observable(false);

    managerViewModel.cancel = function() {
        managerViewModel.notFound(false);
        managerViewModel.editDrink(false);
        managerViewModel.editFood(false);
        managerViewModel.found(false);
        currentItem = null;
    };

    managerViewModel.save = function() {
        remove();
        if (currentItem.type === 'drink') {
            $.ajax({
                url: '/manager/addDrink',
                method: 'POST',
                data: $('.edit-form-submit').serialize()
            })
        } else {
            $.ajax({
                url: '/manager/addFood',
                method: 'POST',
                data: $('.edit-form-submit').serialize()
            })
        }
        managerViewModel.sMessage('Item Successfully Saved.');
        managerViewModel.success(true);
        managerViewModel.cancel();
    };

    managerViewModel.remove = function() {
        remove();
        managerViewModel.sMessage('Item Successfully Removed.');
        managerViewModel.success(true);
        managerViewModel.cancel();
    };


    managerViewModel.find = function() {
        $.ajax({
            url: '/manager/findItem',
            data: $('.find').serialize()
        }).done(function(data) {
            if (data.item) {
                currentItem = data.item;
                managerViewModel.name(currentItem.name);
                managerViewModel.description(currentItem.description);
                managerViewModel.price(currentItem.price);
                if (currentItem.type === 'drink') {
                    managerViewModel.size(currentItem.size);
                    managerViewModel.pour(currentItem.pour);
                    managerViewModel.editDrink(true);
                    if (currentItem.cat == 'bar') {
                        $('#edit-bar').prop('checked', true);
                    } else {
                        $('#edit-non-alcohol').prop('checked', true);
                    }
                } else {
                    managerViewModel.options(currentItem.options);
                    managerViewModel.editFood(true);
                    if (currentItem.cat === 'entree') {
                        $('#edit-entree').prop('checked', true);
                    } else if (currentItem.cat === 'side') {
                        $('#edit-side').prop('checked', true);
                    } else {
                        $('#edit-dessert').prop('checked', true);
                    }
                }
                managerViewModel.found(true);
            } else {
                managerViewModel.sMessage('');
                managerViewModel.success(false);
                managerViewModel.notFound(true);
            }
        });
    };

    function remove() {
        $.ajax({
            url: '/manager/removeMenuItem',
            method: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({item: currentItem})
        })
    }

    managerViewModel.addDrink = function () {
        managerViewModel.drink(true);
        managerViewModel.food(false);
        managerViewModel.isEditing(true);
    };

    managerViewModel.addFood = function () {
        managerViewModel.drink(false);
        managerViewModel.food(true);
        managerViewModel.isEditing(true);
    };

    ko.applyBindings(managerViewModel);
}

new ManagerViewModel();