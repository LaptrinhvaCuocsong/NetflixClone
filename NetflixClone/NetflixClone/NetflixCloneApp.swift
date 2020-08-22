//
//  NetflixCloneApp.swift
//  NetflixClone
//
//  Created by Apple on 8/22/20.
//

import SwiftUI

@main
struct NetflixCloneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
