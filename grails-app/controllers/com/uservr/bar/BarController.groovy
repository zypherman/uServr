package com.uservr.bar

class BarController {

    def index() {

        render view: 'index'
    }

    def order() {
        response.setContentType('text/event-stream')
        response.setCharacterEncoding('UTF-8')
        response.getWriter().write('data: ' + request.JSON.name)
    }
}
