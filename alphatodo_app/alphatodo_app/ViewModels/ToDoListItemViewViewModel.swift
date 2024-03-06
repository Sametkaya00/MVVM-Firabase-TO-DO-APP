//
//  ToDoListItemViewViewModel.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class ToDoListItemViewViewModel: ObservableObject{
    
   // Bu protokol, bir nesnenin içindeki değişen durumu takip etmek ve bu değişiklikleri SwiftUI görünümlerine otomatik olarak yansıtmak için kullanılır. Bu sayede, bir nesne içindeki verilerde meydana gelen değişikliklerin, arayüzdeki görünümlere otomatik olarak yansıtılmasını sağlamak mümkün olur.
    
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        //  Firebase Authentication kütüphanesini kullanarak kullanıcının kimlik bilgilerini kontrol ediyor
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictonary())
    }
    
}
