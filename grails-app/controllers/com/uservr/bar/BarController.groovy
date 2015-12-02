package com.uservr.bar

import bar.BarService
import grails.converters.JSON

import java.util.concurrent.ConcurrentLinkedQueue

class BarController {

    BarService barService

    def beforeInterceptor = [action: this.&auth]

    def index() {
        render view: 'index'
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
        barService.newOrders = new ConcurrentLinkedQueue()
        render JSON.use('deep') { raw(barService.getCurrentOrders() as JSON) }
    }

    def processOrder() {
        render barService.processOrder(request.JSON.order)
    }
}
