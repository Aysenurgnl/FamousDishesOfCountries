//
//  quizdao.swift
//  Famous_dishes_of_countries
//
//  Created by Ayşenur Günal on 8.11.2020.
//

import Foundation
class Dishesdao{
    let db:FMDatabase?
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("quiz.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    //Bring 16 random dishes

    func random16Bring() -> [Dishes]{
        var list = [Dishes]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM dishes ORDER BY RANDOM() LIMIT 16 ", values: nil)
            while (rs.next()) {
                let dishes = Dishes(food_id: Int(rs.string(forColumn: "food_id"))!, country_name: rs.string(forColumn: "country_name")!, food_image: rs.string(forColumn: "food_image")!, food_name: rs.string(forColumn: "food_name")!)
                list.append(dishes)
            }
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
        return list
    }
    
    //Bring 3 random wrong options
    func random3wrongoptions(food_id:Int) -> [Dishes]{
        var list = [Dishes]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM dishes WHERE food_id != ? ORDER BY RANDOM() LIMIT 3 ", values: [food_id])
            while (rs.next()) {
                let dishes = Dishes(food_id: Int(rs.string(forColumn: "food_id"))!, country_name: rs.string(forColumn: "country_name")!, food_image: rs.string(forColumn: "food_image")!, food_name: rs.string(forColumn: "food_name")!)
                list.append(dishes)
            }
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
        return list
        
    }
    
}

