package bar

import groovy.transform.Synchronized
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.util.concurrent.ConcurrentLinkedQueue

class BarService {

    ConcurrentLinkedQueue newOrders = new ConcurrentLinkedQueue()
    ConcurrentLinkedQueue currentOrders = new ConcurrentLinkedQueue()

    def newOrder(String name) {
        newOrders.add(name)
        currentOrders.add(name)
    }

    def newOrders(JSONObject orders) {
        newOrders.addAll(orders)
        currentOrders.addAll(orders)
    }

    def newOrders(JSONArray orders) {
        newOrders.addAll(orders)
        currentOrders.addAll(orders)
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
        currentOrders.remove(order);
    }

}
