//
//  PayrocExampleApp.swift
//  PayrocExample
//
//  Created by Lei Zhang on 01/10/2022.
//

import SwiftUI

@main
struct PayrocExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
