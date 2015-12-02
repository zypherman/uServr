package com.uservr.kitchen

import grails.converters.JSON
import kitchen.KitchenService

class KitchenController {

    KitchenService kitchenService

    def beforeInterceptor = [action: this.&auth]

    def index() {
        def order = kitchenService.getCurrentOrders()
        render view: 'index', model: [order: order]
    }

    def auth() {
        if (!session.getAttribute('kitchen') && !session.getAttribute('manager')) {
            session.setAttribute('from', 'kitchen')
            redirect controller: 'login', action: 'index'
        }
    }

    def order() {
        response.setContentType('text/event-stream')
        response.setCharacterEncoding('UTF-8')

        def orders = JSON.use('deep') { raw(kitchenService.getNewOrders() as JSON) }
        def writer = response.getWriter();

        if (orders) {
            for (def order in orders) {
                writer.write('data: ' + order + "\n\n");
            }
        } else {
            writer.write('')
        }
        writer.flush();
    }

    def getCurrentOrders() {
        render JSON.use('deep') { raw(kitchenService.getCurrentOrders() as JSON) }
    }

    def processOrder() {
        render kitchenService.processOrder(request.JSON.order)
    }
}
