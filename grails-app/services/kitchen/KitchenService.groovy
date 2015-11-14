package kitchen
import groovy.transform.Synchronized
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.util.concurrent.ConcurrentLinkedQueue

class KitchenService {

    ConcurrentLinkedQueue newOrders = new ConcurrentLinkedQueue()
    ConcurrentLinkedQueue currentOrders = new ConcurrentLinkedQueue()

    def newOrders(JSONArray orders) {
        for (int i = 0; i < orders.length(); i++) {
            def order = orders[i]
            if (order.type == 'food') {
                newOrders.add(order)
                currentOrders.add(order)
            }
        }
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
