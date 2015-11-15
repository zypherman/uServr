package menu
import bar.BarService
import kitchen.KitchenService
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.util.concurrent.ConcurrentLinkedQueue

class MenuService {

    BarService barService
    KitchenService kitchenService

    ConcurrentLinkedQueue userOrder = new ConcurrentLinkedQueue()

    def getAvailableDrinks() {
        [new DrinkDTO(name: 'Bud', description: 'Good Beer', price: 1.00),
         new DrinkDTO(name: 'Coors', description: 'Silver Bullet', price: 1.00),
         new DrinkDTO(name: 'Miller', description: 'Beer', price: 1.00),
         new DrinkDTO(name: 'Martini', description: 'Alcohol', price: 4.00)]
//         new DrinkDTO(name: 'Wine', description: 'Red & White', price: 3.00),
//         new DrinkDTO(name: 'Soda', description: 'Pop', price: 1.00),
//         new DrinkDTO(name: 'Moonshine', description: 'Shine', price: 10.00)]
    }
    def getAvailableFood() {
        [new FoodDTO(name: 'Burger', description: 'Beef', price: 2.00),
         new FoodDTO(name: 'Cheeseburger', description: 'Cheesy', price: 3.00),
         new FoodDTO(name: 'Ribeye', description: 'Steak', price: 8.00),
         new FoodDTO(name: 'Porterhouse', description: 'Big Steak', price: 10.00)]
    }

    def addItem(JSONObject item) {
        userOrder.add(item)
    }

    def removeItem(JSONObject item) {
        userOrder.remove(item)
    }

    def getOrder() {
        userOrder
    }

    def sendOrder(JSONArray orders, int tableNumber) {
        JSONArray barOrders = new JSONArray()
        JSONArray kitchenOrders = new JSONArray()

        for (int i = 0; i < orders.length(); i++) {
            def order = orders[i]
            if (order.type == 'drink') {
                barOrders.add(order)
            } else {
                kitchenOrders.add(order)
            }
        }

        if (barOrders.length()) {
            barService.newOrders(new Order(tableNumber: tableNumber, orders: barOrders))
        }
        if (kitchenOrders.length()) {
            kitchenService.newOrders(new Order(tableNumber: tableNumber, orders: kitchenOrders))
        }
        userOrder.removeAll(userOrder)
    }
}
