//
//  NewItemViewVİewModel.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewVİewModel:ObservableObject{
    @Published var title = ""
    @Published var deuDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else{return}
        
        let newItemId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newItemId,
            title: title,
            dueDate: deuDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        //newıtem verisini Firebase ekleme
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictonary())
    }
    
    var canSave: Bool{
       
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            return false
        }
        guard deuDate >= Date().addingTimeInterval(-86400) else{
            
            return false
        }
        return true
    }
}
