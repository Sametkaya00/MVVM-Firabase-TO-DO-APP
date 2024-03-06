//
//  FromView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI

struct LoginFromViewFootterView: View {
   @StateObject var viewmodel = LoginViewViewModel()
    var body: some View {
        Form{
            if !viewmodel.errorMessage.isEmpty{//boş olup olmadığını kontrol ediyoruz
                Text(viewmodel.errorMessage)
                    .foregroundStyle(.red)
                
            }
            TextField("Email Adresiniz",text: $viewmodel.email)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            SecureField("Şifreniz", text: $viewmodel.password)
                .autocorrectionDisabled()
                .autocapitalization(.none)
        }
            
        .scrollContentBackground(.hidden)
        .frame(height: 200)
        
        BigButton(title: "Giriş yap") {
            viewmodel.login()
        }
            
        
       
        Spacer()
        VStack{
            Text("Buralarda yeni misin?")
            NavigationLink("Yeni hesap oluştur!",destination: RegisterView())
        }
        .padding(.bottom,10)
        
        
    }
}

#Preview {
    LoginFromViewFootterView()
}
