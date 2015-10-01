package com.uservr.bar

import bar.BarService
import grails.converters.JSON

class BarController {

    BarService barService

    def index() {
        def order = barService.getCurrentOrders()
        render view: 'index', model: [order: order]
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

    def newOrder() {
        render(barService.newOrder(request.JSON.name))
    }

    def getCurrentOrders() {
        render JSON.use('deep') { raw(barService.getCurrentOrders() as JSON) }
    }

    def processOrder() {
        render barService.processOrder(request.JSON.order)
    }
}
