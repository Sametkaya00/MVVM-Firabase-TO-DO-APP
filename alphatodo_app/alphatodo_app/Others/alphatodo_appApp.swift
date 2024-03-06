//
//  alphatodo_appApp.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//
import FirebaseCore
import SwiftUI

@main
struct alphatodo_appApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
