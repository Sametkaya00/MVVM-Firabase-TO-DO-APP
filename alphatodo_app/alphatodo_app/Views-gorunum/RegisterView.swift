//
//  RegisterView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                
                //Header kısmı
                LoginHeaderView()
                //Regiseter Formu
                Form{
                    
                    Section(header: Text("Kayır formu")){
                        
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        TextField("Tam adınız", text: $viewModel.name)
                            .autocorrectionDisabled()//oto tamamlamayı kapattık
                        TextField("Email adresiniz",text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)//baş harf vermeyi kapattık
                        SecureField("Şifreniz",text: $viewModel.password)
                    }
                }
                .scrollContentBackground(.hidden)
                .frame(height: 220)
                BigButton(title: "Kaydol") {
                    viewModel.register()
                }
                    
                
                Spacer()
               
            }
        }
    }
}

#Preview {
    RegisterView()
}
