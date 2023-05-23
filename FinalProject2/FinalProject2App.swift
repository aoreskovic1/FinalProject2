//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Andrija on 03.12.2022..
//

import SwiftUI

@main
struct FinalProjectApp: App {
    var clubs = Clubs()
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(clubs).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
