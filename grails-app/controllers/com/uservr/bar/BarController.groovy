package com.uservr.bar

import bar.BarService
import grails.converters.JSON

class BarController {

    BarService barService

    def beforeInterceptor = [action: this.&auth]

    def index() {
        def order = barService.getCurrentOrders()
        render view: 'index', model: [order: order]
    }

    def auth() {
        if (!session.getAttribute('bar') && !session.getAttribute('manager')) {
            session.setAttribute('from', 'bar')
            redirect controller: 'login', action: 'index'
        }
    }

    def order() {
        response.setContentType('text/event-stream')
        response.setCharacterEncoding('UTF-8')

        def orders = JSON.use('deep') { raw(barService.getNewOrders() as JSON) }
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
        render JSON.use('deep') { raw(barService.getCurrentOrders() as JSON) }
    }

    def processOrder() {
        render barService.processOrder(request.JSON.order)
    }
}
