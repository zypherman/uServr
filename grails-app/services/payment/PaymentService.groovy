package payment

import com.uservr.web.Customer
import grails.transaction.Transactional

@Transactional
class PaymentService {

    /**
     * Stub to process payment
     * We are not actually doing that so nothing to do here
     */
    def processPayment(Customer customer) {
//        customer?.payment
    }
}
