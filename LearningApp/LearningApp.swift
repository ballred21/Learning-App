//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Braden Allred on 1/10/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
