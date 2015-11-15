package customer

import address.Address
import payment.Payment

class CustomerDTO implements Serializable {

    int id
    String firstName
    String fullName
    String pin
    Address address
    Payment payment
}
