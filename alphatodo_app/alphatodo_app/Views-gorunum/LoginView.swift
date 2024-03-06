//
//  LoginView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        NavigationStack{
          
        VStack{
            
           //header
           LoginHeaderView()
            
//Form - Email, şifre ve button ve footer- hesabınız yokmu
            
            LoginFromViewFootterView()
    
            }
        }
        
       
        Spacer()
    }
}

#Preview {
    LoginView()
}
