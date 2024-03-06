//
//  NewItemView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI

struct NewItemView: View {
    @Binding var newItemPresented : Bool
    @StateObject var viewModel = NewItemViewVİewModel()
    var body: some View {
        VStack{
            Text("Yeni Görev")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.top,50)
            Form{
                TextField("Başlık",text: $viewModel.title)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .padding()
                DatePicker("Bitiş Tarihi", selection: $viewModel.deuDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                BigButton(title: "Kaydet") {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented=false
                    }else{
                        viewModel.showAlert = true
                    }
                }
                   
            }
            .scrollContentBackground(.hidden)
            
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Hata"),
                message: Text("Lütfen tüm alanları doldurun."))
            })
            

        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get:{
        return true
    }, set: {_ in
    }))
}
