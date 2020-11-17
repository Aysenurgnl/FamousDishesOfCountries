//
//  quiz.swift
//  Famous_dishes_of_countries
//
//  Created by Ayşenur Günal on 8.11.2020.
//

import Foundation
class Dishes:Equatable,Hashable{
    var food_id:Int?
    var country_name:String?
    var food_image:String?
    var food_name:String?
    
    init() {
        
    }
    init(food_id:Int,country_name:String,food_image:String,food_name:String) {
        self.food_id = food_id
        self.country_name = country_name
        self.food_image = food_image
        self.food_name = food_name
        
        
    }
    var hashValue : Int{
        get {
            return food_id.hashValue
        }
    }
    static func == (lhs:Dishes,rhs:Dishes) -> Bool{
        return lhs.food_id == rhs.food_id
    }
    
}

