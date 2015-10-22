package com.uservr.menu

class MenuController {

    def index() {

    }

    def itemDetail() {

        render (view: 'itemDetail', model: [params: params])
    }
}
