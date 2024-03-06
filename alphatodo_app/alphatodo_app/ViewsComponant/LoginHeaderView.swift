//
//  HeaderView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI

struct LoginHeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
           
            Image(getLogoName())
                .resizable()
                .frame(width: 200, height: 200)
        }
            
        .padding(.top,100)
    }
    
    func getLogoName() -> String {
           if colorScheme == .dark {
               return "alphalogo2"
           } else {
                return "alphalogo1"
           }
    }
}

#Preview {
    LoginHeaderView()
}
