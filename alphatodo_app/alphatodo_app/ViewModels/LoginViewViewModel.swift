//
//  LoginViewViewModel.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import Foundation
import FirebaseAuth
class LoginViewViewModel :ObservableObject{//gözlemlenebilir obje
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
}

func validate() -> Bool{
    errorMessage = ""
    
    guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
          !password.trimmingCharacters(in: .whitespaces).isEmpty
    
    else{
        errorMessage = "Lütfen tüm alanları doldurun"
        return false
    }
    
    guard email.contains("@") && email.contains(".")else{
        errorMessage = "Lütfen geçerli bir email adersi girin"
        return false
    }
        return true
    }
}
