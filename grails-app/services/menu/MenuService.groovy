package menu

import bar.BarService
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.util.concurrent.ConcurrentLinkedQueue

class MenuService {

    BarService barService

    ConcurrentLinkedQueue userOrder = new ConcurrentLinkedQueue()

    def getAvailableDrinks() {
        [new DrinkDTO(name: 'Bud', description: 'Good Beer', price: '$1.00'),
         new DrinkDTO(name: 'Coors', description: 'Silver Bullet', price: '$1.00'),
         new DrinkDTO(name: 'Miller', description: 'Beer', price: '$1.00'),
         new DrinkDTO(name: 'Martini', description: 'Alcohol', price: '$4.00'),
         new DrinkDTO(name: 'Wine', description: 'Red & White', price: '$3.00'),
         new DrinkDTO(name: 'Soda', description: 'Pop', price: '$1.00'),
         new DrinkDTO(name: 'Moonshine', description: 'Shine', price: '$10.00')]
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

    def sendOrder(JSONArray orders) {
        barService.newOrders(orders)
        userOrder.removeAll(userOrder)
    }
}
