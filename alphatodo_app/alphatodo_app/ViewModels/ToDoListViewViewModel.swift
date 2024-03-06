//
//  ToDoListViewViewModel.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    /// delete to do list item
    ///  - Parameter id: Item id to delete
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }

}
