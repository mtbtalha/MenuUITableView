//
//  Item.swift
//  MenuInTableView
//
//  Created by Talha Babar on 6/25/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import UIKit
import SwiftyJSON

class Item {
   
    let itemId :Int
    let title :String
    let about :String
    let price :Int
    let rating :Int
    let reviews :Int
    let photoUrl :String
    let mostOrdered :Int
    let choiceExist :Bool
    
    init(itemId: Int, title: String, about: String, price: Int, rating: Int, reviews: Int, photoUrl: String, mostOrdered: Int, choiceExist: Bool) {
        self.itemId = itemId
        self.title = title
        self.about = about
        self.price = price
        self.rating = rating
        self.reviews = reviews
        self.photoUrl = photoUrl
        self.mostOrdered = mostOrdered
        self.choiceExist = choiceExist
    }
    
    init(json : JSON) {
        
            self.itemId = json["id"].int!
            self.title = json["title"].string!
            self.about = json["about"].string!
            self.price = json["price"].int!
            self.rating = json["rating"].int!
            self.reviews = json["reviews"].int!
            self.photoUrl = json["photo"].string!
            self.mostOrdered = json["most_ordered"].int!
            self.choiceExist = json["choice_exist"].bool!
        
    }
}
