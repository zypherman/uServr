<div id="registerCustomerModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Welcome to Uservr!</h4>
            </div>

            <div class="modal-body">
                <!-- Register FORM STARTS HERE -->
                <div class="panel panel-default">
                    <div class="panel-heading display-table">
                        <div class="display-tr">
                            <div class="display-td">
                                <p><strong>Start a new order</strong> <span class="glyphicon glyphicon-question-sign" data-placement="right" data-toggle="tooltip" title="For your first order, we collect all of your payment information. Later on, you simply enter your pin and the last four digits of your credit card number to complete an order."></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar">
                                    Billing
                                </div>
                                <div id="bar-two" class="progress-bar" role="progressbar" style="display: none">
                                    Payment
                                </div>
                                <div id="bar-three" class="progress-bar" role="progressbar" style="display: none">
                                    Pin
                                </div>
                            </div>
                        <g:form action="registerCustomer" method="post" class="form-signin form-horizontal new-customer">
                            <div class="form-one">
                                <div class="form-group">
                                    <label for='name' class="labelText">Full Name:</label>
                                    <input id="name" type='text' class='form-control' name='name' placeholder="Full Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="street">Street:</label>
                                    <input id="street" type="text" class="form-control" name="street" placeholder="12345 Street" required>
                                </div>
                                <div class="form-group">
                                    <label for="city">City:</label>
                                    <input id="city" type="text" class="form-control" name="city" placeholder="New City" required>
                                </div>
                                <div class="form-group">
                                    <label for="state">State:</label>
                                    <select class="form-control" id="state" name="state" required>
                                        <option value="">Select:</option>
                                        <option value="AL">Alabama</option>
                                        <option value="AK">Alaska</option>
                                        <option value="AZ">Arizona</option>
                                        <option value="AR">Arkansas</option>
                                        <option value="CA">California</option>
                                        <option value="CO">Colorado</option>
                                        <option value="CT">Connecticut</option>
                                        <option value="DE">Delaware</option>
                                        <option value="DC">District Of Columbia</option>
                                        <option value="FL">Florida</option>
                                        <option value="GA">Georgia</option>
                                        <option value="HI">Hawaii</option>
                                        <option value="ID">Idaho</option>
                                        <option value="IL">Illinois</option>
                                        <option value="IN">Indiana</option>
                                        <option value="IA">Iowa</option>
                                        <option value="KS">Kansas</option>
                                        <option value="KY">Kentucky</option>
                                        <option value="LA">Louisiana</option>
                                        <option value="ME">Maine</option>
                                        <option value="MD">Maryland</option>
                                        <option value="MA">Massachusetts</option>
                                        <option value="MI">Michigan</option>
                                        <option value="MN">Minnesota</option>
                                        <option value="MS">Mississippi</option>
                                        <option value="MO">Missouri</option>
                                        <option value="MT">Montana</option>
                                        <option value="NE">Nebraska</option>
                                        <option value="NV">Nevada</option>
                                        <option value="NH">New Hampshire</option>
                                        <option value="NJ">New Jersey</option>
                                        <option value="NM">New Mexico</option>
                                        <option value="NY">New York</option>
                                        <option value="NC">North Carolina</option>
                                        <option value="ND">North Dakota</option>
                                        <option value="OH">Ohio</option>
                                        <option value="OK">Oklahoma</option>
                                        <option value="OR">Oregon</option>
                                        <option value="PA">Pennsylvania</option>
                                        <option value="RI">Rhode Island</option>
                                        <option value="SC">South Carolina</option>
                                        <option value="SD">South Dakota</option>
                                        <option value="TN">Tennessee</option>
                                        <option value="TX">Texas</option>
                                        <option value="UT">Utah</option>
                                        <option value="VT">Vermont</option>
                                        <option value="VA">Virginia</option>
                                        <option value="WA">Washington</option>
                                        <option value="WV">West Virginia</option>
                                        <option value="WI">Wisconsin</option>
                                        <option value="WY">Wyoming</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="zip">Zip Code:</label>
                                    <input id="zip" type="text" class="form-control" maxlength="5" name="zip" placeholder="ex. 55555" required>
                                </div>
                            </div>
                            <div class="form-two" style="display: none;">
                                <div class="form-group">
                                    <label for="credit">Credit Card:</label>
                                    <input id="credit" class="form-control" type="number" name="credit" placeholder="1111222233334444" required>
                                </div>
                                <div class="form-group">
                                    <label for="exp">Expiration:</label>
                                    <input id="exp" class="form-control" type="number" name="exp" placeholder="ex. 12/2015" required>
                                </div>
                                <div class="form-group">
                                    <label for="cvv">CVV: <span class="glyphicon glyphicon-question-sign" data-placement="right" data-toggle="tooltip" title="3 or 4 digit security code on the back of your credit card."></span></label>
                                    <input id="cvv" class="form-control" type="number" name="cvv" required>
                                </div>
                            </div>
                            <div class="form-three" style="display: none;">
                                <div class="form-group has-feedback" id="pin-group">
                                    <label for='pin' class="labelText">Pin: <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" title="Enter a 4 digit pin. Remember this for placing additional orders."></span></label>
                                    <input id="pin" type='password' name='pin' class="form-control" placeholder="ex. 1234" required maxlength="4"/>
                                    <span id="pin-success" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="display: none;"></span>
                                    <span id="pin-error" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="display: none;"></span>
                                </div>
                                <div class="form-group has-feedback" id="pin2-group">
                                    <label for='pin2' class="labelText">Confirm Pin:</label>
                                    <input id="pin2" type='password' placeholder="Same as above" name='pin2' class="form-control" maxlength="4" required/>
                                    <span id="pin2-success" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="display: none;"></span>
                                    <span id="pin2-error" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="display: none;"></span>
                                </div>
                            </div>
                            <div class="form-group modal-buttons step1">
                                <button id="back" type="button" class="btn btn-warning">Cancel</button>
                                <button id="next" type="button" class="btn btn-primary">Next</button>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
            <!-- Register FORM ENDS HERE -->
        </div>
    </div>
</div>
