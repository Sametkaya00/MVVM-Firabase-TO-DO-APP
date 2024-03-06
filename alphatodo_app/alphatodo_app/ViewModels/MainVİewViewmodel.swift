//
//  MainVİewViewmodel.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import Foundation
import FirebaseAuth

class MainVİewViewmodel:ObservableObject{
    @Published var currenUserId : String = ""
    
    init(){
        Auth.auth().addStateDidChangeListener{[weak self]_, user in
            DispatchQueue.main.async{
                self?.currenUserId=user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn:Bool{
        return Auth.auth().currentUser != nil
    }
}
