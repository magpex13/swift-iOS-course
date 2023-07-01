//
//  Location+CoreDataProperties.swift
//  IntroductionCoreDataExercise
//
//  Created by Magno on 9/05/23.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }


}

extension Location : Identifiable {

}
