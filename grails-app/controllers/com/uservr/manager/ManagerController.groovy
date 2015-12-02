package com.uservr.manager
import grails.converters.JSON
import menu.DrinkDTO
import menu.FoodDTO

class ManagerController {

    def menuService
    def orderHistoryService

    def beforeInterceptor = [action: this.&auth]

    def index() {
        def drinkViewModel = menuService.drinks
        def foodViewModel = menuService.food
        def orderHistoryViewModel = orderHistoryService.orderHistory()
        render view: 'index', model: [drinkViewModel: JSON.use('deep') { raw(drinkViewModel as JSON) },
                                      foodViewModel: JSON.use('deep') { raw(foodViewModel as JSON) },
                                      orderHistoryViewModel: JSON.use('deep') { raw(orderHistoryViewModel as JSON) }]
    }

    def edit() {
        render view: 'edit'
    }

    def auth() {
        if (!session.getAttribute('manager')) {
            session.setAttribute('from', 'manager')
            redirect controller: 'login', action: 'index'
        }
    }

    def addDrink(AddDrinkCommand addDrinkCommand) {
        DrinkDTO drinkDTO = new DrinkDTO()
        drinkDTO.name = addDrinkCommand.name
        drinkDTO.description = addDrinkCommand.description
        drinkDTO.price = Double.parseDouble(addDrinkCommand.price)
        drinkDTO.size = addDrinkCommand.size
        drinkDTO.pour = addDrinkCommand.pour
        drinkDTO.cat = addDrinkCommand.cat
        menuService.drinks.add(drinkDTO)
        redirect view: 'index'
    }

    def addFood(AddFoodCommand addFoodCommand) {
        FoodDTO foodDTO = new FoodDTO()
        foodDTO.name = addFoodCommand.name
        foodDTO.description = addFoodCommand.description
        foodDTO.price = Double.parseDouble(addFoodCommand.price)
        foodDTO.options = addFoodCommand.options.split(',')
        foodDTO.cat = addFoodCommand.cat
        menuService.food.add(foodDTO)
        redirect view: 'index'
    }

    def removeMenuItem() {
        render menuService.removeMenuItem(request.JSON.item)
    }

    def findItem() {
        def item = [item: menuService.findItem(params.editName)]
        render item as JSON
    }
}

class AddFoodCommand extends AddItemCommand {
    String options
}

class AddDrinkCommand extends AddItemCommand {
    String size
    String pour
}

class AddItemCommand {
    String name
    String description
    String price
    String cat
}
