//
//  Swift_TODOApp.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.

import FirebaseCore
import SwiftUI

@main
struct Swift_TODOApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
