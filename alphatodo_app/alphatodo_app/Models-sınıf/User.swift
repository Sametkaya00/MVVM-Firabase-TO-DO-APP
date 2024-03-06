//
//  User.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import Foundation

struct User:Codable{
    let id: String
    let name:String
    let email:String
    let joined: TimeInterval
}
