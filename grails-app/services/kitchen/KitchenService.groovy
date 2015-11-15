package kitchen

import groovy.transform.Synchronized
import menu.Order
import org.codehaus.groovy.grails.web.json.JSONObject

import java.util.concurrent.ConcurrentLinkedQueue

class KitchenService {

    ConcurrentLinkedQueue newOrders = new ConcurrentLinkedQueue()
    ConcurrentLinkedQueue currentOrders = new ConcurrentLinkedQueue()

    def newOrders(Order order) {
        newOrders.add(order)
        currentOrders.add(order)
    }

    @Synchronized
    def getNewOrders() {
        def array = null
        if (newOrders.size()) {
            array = newOrders
            newOrders = new ConcurrentLinkedQueue()
        }
        array
    }

    def getCurrentOrders() {
        currentOrders
    }

    def processOrder(JSONObject order) {
        currentOrders.remove(order as Order);
    }
}
