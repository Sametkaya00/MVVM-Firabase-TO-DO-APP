//
//  BigButtonView.swift
//  alphatodo_app
//
//  Created by samet kaya on 29.02.2024.
//

import SwiftUI

struct BigButton: View {
    let title:String
    let action:() -> Void
    var body: some View {
        Button(action:action
            // butona tıklandığında ne olacak.
        , label: {
            
            ZStack{
              
                RoundedRectangle(cornerRadius: 9)
                    .foregroundStyle(.primary)
                Text(title)
                    .foregroundStyle(.white)
                
            }
           
        })
            
        .frame(height: 50)
        .padding(.horizontal)
       
    }
}

#Preview {
    BigButton(title: "Giriş yap", action: {})
}
