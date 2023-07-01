import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        menuItems.forEach { menuItem in
            if !Dish.checkDishExists(menuItem: menuItem, context) {
                let dish = Dish(context: context)
                dish.name = menuItem.title
                dish.price = Float(menuItem.price) ?? 0
            }
        }
    }
    
    static func checkDishExists(menuItem: MenuItem, _ context: NSManagedObjectContext) -> Bool {
        let request = Dish.request()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", menuItem.title)
        
        do {
            guard let dishes = try context.fetch(request) as? [Dish], dishes.count > 0 else {
                throw NSError()
            }
        } catch {
            return false
        }
        return true
    }
}
