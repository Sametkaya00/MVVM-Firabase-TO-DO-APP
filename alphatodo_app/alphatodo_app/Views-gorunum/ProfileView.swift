//
//  ProfileView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewMoedel = ProfileViewVİewModel()
    
    init(){}
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = viewMoedel.user{
                    profile(user: user)
                }
                else{
                    Text("Profil Yükleniyor...")
                }
              
                
                // logout işlemi yapılacak.
                BigButton(title: "Çıkış yap") {
                    viewMoedel.logout()
                }
            }
            .navigationTitle("Profil")
        }
        .onAppear{
            viewMoedel.fetchUser()
        }
    }
    @ViewBuilder func profile(user:User)-> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125,height: 125)
        
        VStack{
            HStack{
                Text("İsim:")
                Text(user.name)
            }
            HStack{
                Text("Email:")
                Text(user.email)
            }
            HStack{
                Text("Kayıt tarihi:")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated,time:.shortened))")
            }
        }
    }
}

#Preview {
    ProfileView()
}
