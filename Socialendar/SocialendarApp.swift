//
//  SocialendarApp.swift
//  Socialendar
//
//  Created by Andre Scheir Johansson on 2024-09-15.
//

import SwiftUI

@main
struct SocialendarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
