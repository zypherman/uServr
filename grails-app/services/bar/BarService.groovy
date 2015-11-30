package bar
import groovy.transform.Synchronized
import menu.Order
import org.codehaus.groovy.grails.web.json.JSONObject

import java.util.concurrent.ConcurrentLinkedQueue

class BarService {

    ConcurrentLinkedQueue newOrders = new ConcurrentLinkedQueue()
    ConcurrentLinkedQueue currentOrders = new ConcurrentLinkedQueue()
    ConcurrentLinkedQueue barHistory = new ConcurrentLinkedQueue()

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
        currentOrders.remove(order as Order)
        barHistory.add(order as Order)
    }

}
