//
//  Dessert+CoreDataProperties.swift
//  IntroductionCoreDataExercise
//
//  Created by Magno on 9/05/23.
//
//

import Foundation
import CoreData


extension Dessert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dessert> {
        return NSFetchRequest<Dessert>(entityName: "Dessert")
    }


}

extension Dessert : Identifiable {

}
