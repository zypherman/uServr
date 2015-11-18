package menu
import bar.BarService
import kitchen.KitchenService
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.util.concurrent.ConcurrentLinkedQueue

class MenuService {

    BarService barService
    KitchenService kitchenService

    ConcurrentLinkedQueue userOrder = new ConcurrentLinkedQueue()

    def getAvailableDrinks() {
        [new DrinkDTO(name: 'Water', description: 'Tapped from a Glacier', size: '12 oz', pour: 'Glass', price: 0.00),
         new DrinkDTO(name: 'Coke', description: 'Soda', size: '12 oz', pour: 'Glass', price: 1.00),
         new DrinkDTO(name: 'Sprite', description: 'Soda', size: '12 oz', pour: 'Glass', price: 1.00),
         new DrinkDTO(name: 'Mellow Yellow', description: 'Soda', size: '12 oz', pour: 'Glass', price: 1.00),
         new DrinkDTO(name: 'Diet Coke', description: 'Soda', size: '12 oz', pour: 'Glass', price: 1.00),
         new DrinkDTO(name: 'Lemonade', description: 'Freshly Squeezed Lemons', size: '12 oz', pour: 'Glass', price: 2.00),
         new DrinkDTO(name: 'San Pellegrino', description: 'Sparkling Mineral Water', size: '16.9 oz', pour: 'Bottle', price: 10.00, imgSrc: 'Sanpellegrino.jpg'),
         new DrinkDTO(name: 'Bud Lite', description: 'Grab a Bud', size: '12 oz', pour: 'Bottle', price: 3.00, cat: 'bar'),
         new DrinkDTO(name: 'Coors Lite', description: 'Straight from the Rocky Mountains', size: '12 oz', pour: 'On Tap', price: 2.00, cat: 'bar'),
         new DrinkDTO(name: 'Miller Lite', description: 'Its Miller Time', size: '12 oz', pour: 'On Tap', price: 2.00, cat: 'bar'),
         new DrinkDTO(name: 'Fosters', description: 'Australian for Beer', size: '12 oz', pour: 'Can', price: 3.00, cat: 'bar'),
         new DrinkDTO(name: 'Spotted Cow', description: 'Straight from Gods Country', size: '6 oz', pour: 'Mixed Drink Glass', price: 4.00, cat: 'bar', imgSrc: 'SpottedCow.jpg'),
         new DrinkDTO(name: 'Gin and Tonic', description: 'Tanqueray & Tonic Water', size: '6 oz', pour: 'Mixed Drink Glass', price: 4.00, cat: 'bar'),
         new DrinkDTO(name: 'Rum and Coke', description: 'Jack Daniels and Coke', size: '6 oz', pour: 'Mixed Drink Glass', price: 4.00, cat: 'bar'),
         new DrinkDTO(name: 'Red Wine', description: 'From the Hills of California', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar'),
         new DrinkDTO(name: 'White Wine', description: 'From an Italian Vineyard', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar'),
         new DrinkDTO(name: 'Martini', description: 'Shaken not Stirred', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar')]
    }
    def getAvailableFood() {

        [new FoodDTO(name: 'Hamburger', description: 'Angus Beef on Sesame Seed Bun', price: 10.00, options:['Pickles', 'Onions', 'Lettuce', 'Tomato', 'Ketchup', 'Mustard', 'Mayo'], cat: 'entree'),
         new FoodDTO(name: 'Spaghetti & Meatballs', description: 'Angel Hair with Homemade Meatballs', price: 10.00, options:['Cheese'], cat: 'entree'),
         new FoodDTO(name: 'Steak', description: '8 oz Ribeye Steak', price: 12.00, options:['Rare', 'Medium Rare', 'Medium', 'Medium Well', 'Well'], cat: 'entree'),
         new FoodDTO(name: 'Pizza', description: 'Make a Custom Pizza', price: 15.00, options:['Cheese', 'Sausage', 'Canadian Bacon', 'Pepperoni', 'Olives', 'Peppers', 'Onion', 'Thin Crust', 'Chicago Style', 'Stuffed Crust'], cat: 'entree'),
         new FoodDTO(name: 'Fried Rice', description: 'Make a Custom Fried Rice', price: 10.00, options:['Chicken', 'Steak', 'Pork', 'Tofu', 'Broccoli', 'Peas', 'Mini Corn', 'Peppers'], cat: 'entree'),
         new FoodDTO(name: 'Chicken Wings', description: 'Deep Fried Chicken Wings', price: 8.00, options:['Barbecue', 'Buffalo', 'Classic', 'Ranch', 'Blue Cheese', 'Honey Mustard'], cat: 'entree'),
         new FoodDTO(name: 'Fries', description: 'Your Choice of Fries', price: 4.00, options:['Small', 'Medium', 'Large'], cat: 'side'),
         new FoodDTO(name: 'Vegetables', description: 'Your Choice of Cooked Vegetables', price: 3.00, options:['Broccoli', 'Cauliflower', 'Carrots', 'Green Beans'], cat: 'side'),
         new FoodDTO(name: 'Fruit', description: 'Your Choice of Fresh Fruit', price: 5.00, options:['Strawberry', 'Blueberry', 'Pineapple', 'Apple', 'Cherry', 'Orange'], cat: 'side'),
         new FoodDTO(name: 'Bread', description: 'Your Choice of Breads', price: 2.00, options:['Garlic Bread', 'Breadsticks', 'Rolls'], cat: 'side'),
         new FoodDTO(name: 'Strawberry Cheesecake', description: 'Strawberries in Cheesecake', price: 8.00, cat: 'dessert'),
         new FoodDTO(name: 'Giant Cookie', description: 'Chocolate Chip Cookie with Ice Cream', price: 6.00, cat: 'dessert'),
         new FoodDTO(name: 'Tiramisu', description: 'Flown in from Italy', price: 10.00, cat: 'dessert')]
    }

    def getFeaturedDrinks() {
        [new DrinkDTO(name: 'Red Wine', description: 'From the Hills of California', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar', imgSrc: "RedWine.jpg"),
         new DrinkDTO(name: 'White Wine', description: 'From an Italian Vineyard', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar', imgSrc: "RedWine.jpg"),
         new DrinkDTO(name: 'Martini', description: 'Shaken not Stirred', size: '6 oz', pour: 'Wine Glass', price: 5.00, cat: 'bar', imgSrc: "Martini.jpg")]
    }

    def getFeaturedFood() {
        [new FoodDTO(name: 'Ribeye', description: 'Steak', price: 8.00, imgSrc: "Ribeye.jpg"),
         new FoodDTO(name: 'Porterhouse', description: 'Big Steak', price: 10.00, imgSrc: "Ribeye.jpg"),
         new FoodDTO(name: 'Spaghetti & Meatballs', description: 'Angel Hair with Homemade Meatballs', price: 10.00, options:['Cheese'], imgSrc: "SpaghettiMeatballs.jpg")]
    }

    def addItem(JSONObject item) {
        userOrder.add(item)
    }

    def removeItem(JSONObject item) {
        userOrder.remove(item)
    }

    def getOrder() {
        userOrder
    }

    def sendOrder(JSONArray orders, int tableNumber) {
        JSONArray barOrders = new JSONArray()
        JSONArray kitchenOrders = new JSONArray()

        for (int i = 0; i < orders.length(); i++) {
            def order = orders[i]
            if (order.type == 'drink') {
                barOrders.add(order)
            } else {
                kitchenOrders.add(order)
            }
        }

        if (barOrders.length()) {
            barService.newOrders(new Order(tableNumber: tableNumber, orders: barOrders))
        }
        if (kitchenOrders.length()) {
            kitchenService.newOrders(new Order(tableNumber: tableNumber, orders: kitchenOrders))
        }
        userOrder.removeAll(userOrder)
    }
}
