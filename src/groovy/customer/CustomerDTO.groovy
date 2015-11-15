package customer

import address.Address
import payment.Payment

class CustomerDTO {

    int id
    String name
    String pin
    Address address
    Payment payment
}
