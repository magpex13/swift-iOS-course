import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var price2: Int { get set }
    var ingredients: [Ingredient] { get set }
}

struct MenuItem: Identifiable, MenuItemProtocol {
    let price: Double
    let menuCategory: MenuCategory
    var ordersCount: Int
    var price2: Int
    var ingredients: [Ingredient]
    let id = UUID()
    let title: String
}

protocol MenuViewData {
    var foods: [MenuItem] { get set }
    var drinks: [MenuItem] { get set }
    var desserts: [MenuItem] { get set }
}

struct MockData: MenuViewData {
    var foods: [MenuItem] = (1...12).map { MenuItem(price: Double($0), menuCategory: MenuCategory.food, ordersCount: Int.random(in: 1...10), price2: $0, ingredients: [Ingredient.tomatoSauce, Ingredient.pasta, Ingredient.broccoli], title: "Food \($0)") }
    
    var drinks: [MenuItem] = (1...8).map { MenuItem(price: Double($0), menuCategory: MenuCategory.drinks, ordersCount: Int.random(in: 1...10), price2: $0, ingredients: [Ingredient.carrot, Ingredient.spinach], title: "Drink \($0)") }
    
    var desserts: [MenuItem] = (1...4).map { MenuItem(price: Double($0), menuCategory: MenuCategory.dessert, ordersCount: Int.random(in: 1...10), price2: $0, ingredients: [Ingredient.carrot, Ingredient.spinach], title: "Dessert \($0)") }
}

class MenuViewViewModel {
    var foods: [MenuItem] = []
    
    var drinks: [MenuItem] = []
    
    var desserts: [MenuItem] = []
    
    var delegate: MenuViewData?
    
    init(_ delegate: MenuViewData? = nil) {
        self.delegate = delegate
        
        if let delegate =  self.delegate {
            self.foods = delegate.foods
            self.drinks = delegate.drinks
            self.desserts = delegate.desserts
        }
    }
    
    init(_ foods: [MenuItem], _ drinks: [MenuItem] , _ desserts: [MenuItem]) {
        self.foods = foods
        self.drinks = drinks
        self.desserts = desserts
    }
}

/*
class MenuViewViewModel {
    let foods: [MenuItem] = [
        MenuItem(title: "Conejo1", ingredients: [.carrot, .broccoli]),
        MenuItem(title: "Conejo1", ingredients: [.carrot, .broccoli]),
    ]
    
    let drinks: [MenuItem] = [
        MenuItem(title: "Conejo1", ingredients: [.spinach]),
        MenuItem(title: "Conejo1", ingredients: [.carrot]),
    ]

    let desserts: [MenuItem] = [
        MenuItem(title: "Conejo1", ingredients: [.carrot]),
        MenuItem(title: "Conejo1", ingredients: [.spinach]),
    ]

}
*/
