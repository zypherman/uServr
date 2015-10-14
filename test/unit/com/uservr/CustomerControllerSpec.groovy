package com.uservr

import com.uservr.customer.CustomerController
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(CustomerController)
class CustomerControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "sample test"() {
        given:
        def number = 7
        def number2 = 8
        when:
        def total = 7 + 8
        then:
        assert total == 15
    }
}
