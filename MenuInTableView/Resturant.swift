//
//  Resturant.swift
//  MenuInTableView
//
//  Created by Talha Babar on 6/25/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import UIKit
import SwiftyJSON

class Resturant {
    
    let resturantId :Int!
    let menuVersion :Double?
    let menuSections :[MenuSection]?
    
    init(resturantId: Int, menuVersion: Double, menuSectionArray: [MenuSection]){
        self.resturantId = resturantId
        self.menuVersion = menuVersion
        self.menuSections = menuSectionArray
    }
   
    init(json: JSON) {
        self.menuSections = []
        self.menuVersion = json[0]["menu_version"].double
        self.resturantId = json[0]["restaurant_id"].int
        
        if let menuItems = json[0]["MenuSection"].array {
        
        for menuSection in menuItems {
            var newItem = MenuSection(json: menuSection)
            self.menuSections?.append(newItem)
        }
        }

    }
}
