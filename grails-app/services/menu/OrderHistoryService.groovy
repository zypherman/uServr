package menu

class OrderHistoryService {

    def barService
    def kitchenService

    def orderHistory() {
        def kitchen = kitchenService.kitchenHistory
        def bar = barService.barHistory
        def history = []

        def barItems = []
        for (def order : bar) {
            def thing = order as Order
            barItems.addAll(thing.orders)
        }

        for (def i = 0; i < barItems.size(); i++) {
            def temp = new HistoryDTO()
            temp.menuItem = barItems[i] as DrinkDTO
            temp.count++
            temp.sales += temp.menuItem.price
            barItems.remove(barItems[i])
            i--
            for (def j = 0; j < barItems.size(); j++) {
                if (temp.menuItem.name == (barItems[j] as DrinkDTO).name) {
                    temp.count++
                    temp.sales += temp.menuItem.price
                    barItems.remove(barItems[j])
                    j--
                }
            }
            history.add(temp)
        }

        def foodItems = []
        for (def order : kitchen) {
            def thing = order as Order
            foodItems.addAll(thing.orders)
        }

        for (def i = 0; i < foodItems.size(); i++) {
            def temp = new HistoryDTO()
            temp.menuItem = foodItems[i] as FoodDTO
            temp.count++
            temp.sales += temp.menuItem.price
            foodItems.remove(foodItems[i])
            i--
            for (def j = 0; j < foodItems.size(); j++) {
                if (temp.menuItem.name == (foodItems[j] as FoodDTO).name) {
                    temp.count++
                    temp.sales += temp.menuItem.price
                    foodItems.remove(foodItems[j])
                    j--
                }
            }
            history.add(temp)
        }
        history.sort{ a, b ->
            b.sales <=> a.sales
        }
    }
}
