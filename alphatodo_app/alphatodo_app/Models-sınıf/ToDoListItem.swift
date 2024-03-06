//
//  ToDoList.swift
//  alphatodo_app
//
//  Created by samet kaya on 28.02.2024.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{ //Codable bi protocoldür veri modelini json formatına cevirmekle görevlidir  Bu, özellikle ağ üzerinden veri alışverişi yaparken veya veriyi dosyalara kaydederken kullanışlıdır.
    let id:String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone:Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
