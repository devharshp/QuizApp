//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 20/01/25.
//

import SwiftUI

@main
struct QuizAppApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      QuizView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
