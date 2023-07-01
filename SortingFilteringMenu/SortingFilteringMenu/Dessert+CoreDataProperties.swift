//
//  Dessert+CoreDataProperties.swift
//  SortingFilteringMenu
//
//  Created by Magno on 10/05/23.
//
//

import Foundation
import CoreData


extension Dessert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dessert> {
        return NSFetchRequest<Dessert>(entityName: "Dessert")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var size: String?
    @NSManaged public var fromCustomer: NSSet?

}

// MARK: Generated accessors for fromCustomer
extension Dessert {

    @objc(addFromCustomerObject:)
    @NSManaged public func addToFromCustomer(_ value: Customer)

    @objc(removeFromCustomerObject:)
    @NSManaged public func removeFromFromCustomer(_ value: Customer)

    @objc(addFromCustomer:)
    @NSManaged public func addToFromCustomer(_ values: NSSet)

    @objc(removeFromCustomer:)
    @NSManaged public func removeFromFromCustomer(_ values: NSSet)

}

extension Dessert : Identifiable {
    static func request() -> NSFetchRequest<NSFetchRequestResult> {
        var request = NSFetchRequest<NSFetchRequestResult>()
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }
    
    func getAllDishesFromCustomer(customerFullName: String, _ context: NSManagedObjectContext) -> [Dessert]? {
        let dessertRequest = Dessert.request()
        guard let customer = Customer().getByFullName(fullName: customerFullName, context) else {
            return nil
        }
        
        dessertRequest.predicate = NSPredicate(format: "fromCustomer CONTAINS %@", customer)
        
        do {
            guard let desserts = try context.fetch(dessertRequest) as? [Dessert] else {
                return nil
            }
            return desserts
        } catch(let error) {
            print(error)
            return nil
        }
    }
}
