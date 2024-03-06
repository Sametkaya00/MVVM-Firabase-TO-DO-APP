//
//  HeaderView.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import SwiftUI

struct LoginHeaderView: View {
    @State private var moveRight = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
           
            Image(getLogoName())
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(25)
                .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.blue, lineWidth: 3))
                .shadow(color:.blue,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .rotationEffect(.degrees(moveRight ? 10 : -10))
                .onAppear{
                    withAnimation(Animation.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                        moveRight.toggle()
                }
            }
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
