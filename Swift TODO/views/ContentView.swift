//
//  ContentView.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewmodel = MainViewVM()
    var body: some View {
        if viewmodel.isSignedIn, !viewmodel.currentUserId.isEmpty{
            accountView
        }else{
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            TodoListView(userId:viewmodel.currentUserId)
                .tabItem {
                    Label("Home",systemImage:"house")
                }
            
            ProfileViews()
                .tabItem {
                    Label("Profile",systemImage:"person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
