//
//  ToDoListView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI
import FirebaseFirestoreSwift
struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery(collectionPath: "users/{userId}/todos") var items: [ToDoListItem]
    
    
    init(userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
        
        
    }// init todolistview içindeki kodları okumadan önce initi okur ondan sonra diğer kodlarımızı okur yani bi önceliğe sahiptir
    var body: some View {
        NavigationView{
            VStack{
                
                List(items){
                    item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Sil"){
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
               
            }
            .navigationTitle("Görevler")
            .toolbar{
                Button{
                    //Sheet açma kodları yer alacak
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented:$viewModel.showingNewItemView)
            })
            
        }
       
     
    }
}


#Preview {
    ToDoListView(userId: "QT6iAVxjtPeHPGSIhUDe6GI7KCC3")
}
