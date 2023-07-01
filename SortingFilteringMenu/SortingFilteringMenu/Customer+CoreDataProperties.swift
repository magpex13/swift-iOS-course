//
//  Customer+CoreDataProperties.swift
//  SortingFilteringMenu
//
//  Created by Magno on 10/05/23.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var email: String?
    @NSManaged public var fullName: String?
    @NSManaged public var toDessert: NSSet?

}

// MARK: Generated accessors for toDessert
extension Customer {

    @objc(addToDessertObject:)
    @NSManaged public func addToToDessert(_ value: Dessert)

    @objc(removeToDessertObject:)
    @NSManaged public func removeFromToDessert(_ value: Dessert)

    @objc(addToDessert:)
    @NSManaged public func addToToDessert(_ values: NSSet)

    @objc(removeToDessert:)
    @NSManaged public func removeFromToDessert(_ values: NSSet)

}

extension Customer : Identifiable {
    static func request() -> NSFetchRequest<NSFetchRequestResult> {
        var customerFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Self.self))
        customerFetchRequest.returnsDistinctResults = true
        customerFetchRequest.returnsObjectsAsFaults = true
        return customerFetchRequest
    }
    func getByFullName(fullName: String, _ context: NSManagedObjectContext) -> Customer? {
        let customerFetchRequest = Customer.request()
        customerFetchRequest.predicate = NSPredicate(format: "fullName CONTAINS[cd] %@", fullName)
        
        do {
            guard let customers = try context.fetch(customerFetchRequest) as? [Customer] else {
                return nil
            }
            
            return customers.first
        } catch {
            print(error)
            return nil
        }
    }
}
