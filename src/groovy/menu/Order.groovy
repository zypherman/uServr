package menu

import groovy.transform.EqualsAndHashCode
import org.codehaus.groovy.grails.web.json.JSONArray

@EqualsAndHashCode
class Order {

    int tableNumber
    JSONArray orders
}
