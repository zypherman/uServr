class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'customer', action: 'welcome')
        "500"(view: '/error')
    }
}
