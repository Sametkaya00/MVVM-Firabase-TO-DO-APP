//
//  ContentView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainVİewViewmodel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currenUserId.isEmpty{
            accountView
        }
        else{
            LoginView()
        }
       
    }
           
    @ViewBuilder var accountView : some View{
        TabView{
            ToDoListView(userId: viewModel.currenUserId)
                .tabItem { Label("Görevelr",systemImage: "house") }
            ProfileView()
                .tabItem { Label("Profil",systemImage: "person.circle") }
                
            }
      
        }
    }
#Preview {
    MainView()
}
