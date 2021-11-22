//
//  Fitness_ChallengeApp.swift
//  Fitness Challenge
//
//  Created by Dave Pope on 21/10/2021.
//

import SwiftUI

@main
struct Fitness_ChallengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
