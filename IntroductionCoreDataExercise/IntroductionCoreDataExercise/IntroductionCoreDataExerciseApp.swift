//
//  IntroductionCoreDataExerciseApp.swift
//  IntroductionCoreDataExercise
//
//  Created by Magno on 9/05/23.
//

import SwiftUI

@main
struct IntroductionCoreDataExerciseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
