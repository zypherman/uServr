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
        [new DrinkDTO(name: 'Water', description: 'Tapped from a Glacier', size: '12 oz', pour: 'Glass', price: 0.00),
         new DrinkDTO(name: 'Coke', description: 'Soda', size: '12 oz', pour: 'Glass', price: 1.00),
         new DrinkDTO(name: 'Sprite', description: 'Soda', size: '12 oz', pour: 'Glass', price: 1.00),
         new DrinkDTO(name: 'Mellow Yellow', description: 'Soda', size: '12 oz', pour: 'Glass', price: 1.00),
         new DrinkDTO(name: 'Diet Coke', description: 'Soda', size: '12 oz', pour: 'Glass', price: 1.00),
         new DrinkDTO(name: 'Lemonade', description: 'Freshly Squeezed Lemons', size: '12 oz', pour: 'Glass', price: 2.00),
         new DrinkDTO(name: 'San Pellegrino', description: 'Sparkling Mineral Water', size: '16.9 oz', pour: 'Bottle', price: 10.00),
         new DrinkDTO(name: 'Bud Lite', description: 'Grab a Bud', size: '12 oz', pour: 'Bottle', price: 3.00, cat: 'bar'),
         new DrinkDTO(name: 'Coors Lite', description: 'Straight from the Rocky Mountains', size: '12 oz', pour: 'On Tap', price: 2.00, cat: 'bar'),
         new DrinkDTO(name: 'Miller Lite', description: 'Its Miller Time', size: '12 oz', pour: 'On Tap', price: 2.00, cat: 'bar'),
         new DrinkDTO(name: 'Fosters', description: 'Australian for Beer', size: '12 oz', pour: 'Can', price: 3.00, cat: 'bar'),
         new DrinkDTO(name: 'Spotted Cow', description: 'Straight from Gods Country', size: '6 oz', pour: 'Mixed Drink Glass', price: 4.00, cat: 'bar'),
         new DrinkDTO(name: 'Gin and Tonic', description: 'Tanqueray & Tonic Water', size: '6 oz', pour: 'Mixed Drink Glass', price: 4.00, cat: 'bar'),
         new DrinkDTO(name: 'Rum and Coke', description: 'Jack Daniels and Coke', size: '6 oz', pour: 'Mixed Drink Glass', price: 4.00, cat: 'bar'),
         new DrinkDTO(name: 'Red Wine', description: 'From the Hills of California', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar'),
         new DrinkDTO(name: 'White Wine', description: 'From an Italian Vineyard', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar'),
         new DrinkDTO(name: 'Martini', description: 'Shaken not Stirred', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar')]
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
