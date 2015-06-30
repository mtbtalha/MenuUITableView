//
//  MenuSection.swift
//  MenuInTableView
//
//  Created by Talha Babar on 6/25/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import UIKit
import SwiftyJSON

class MenuSection {
    
    let menuId: Int
    let name: String
    let itemArray: [Item]?
    
    init(menuId: Int, name: String, itemArray: [Item]) {
        self.menuId = menuId
        self.name = name
        self.itemArray = itemArray
    }
    
    init(json : JSON){
        self.itemArray = []
        self.menuId = json["id"].int!
        self.name = json["name"].string!
        
        let items = json["Item"].array!
        
        for menuItem in items {
            var newItem = Item(json: menuItem)
            self.itemArray?.append(newItem)
        }
        
    }
   
}
