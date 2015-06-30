//
//  ViewController.swift
//  MenuInTableView
//
//  Created by Talha Babar on 6/24/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurant : Resturant?
    let url = "http://c88ba3e.ngrok.com:80/api/v1/restaurants/menu/?restaurant_id=844"
    
    @IBOutlet weak var tableView: UITableView!
    
    private enum Sections : Int {
        case Restaurant = 0
        case Beverages
        case SmallPizzas
        case LargePizzas
        case Calzone
        case BrickOvenRolls
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var number : Int?
        
        var number2 = number ?? 5
        
        tableView.dataSource = self
        tableView.delegate = self
        
        Alamofire.request(.GET, url).responseJSON { (req, res, json, error) in
                if(error != nil) {

                    NSLog("Error: \(error)")
                    println(req)
                    println(res)
                }
                else {
                    NSLog("Success: \(self.url)")
                    var recievedJson = JSON(json!)
                    self.restaurant = Resturant(json: recievedJson)
                    self.tableView.reloadData()
                }
        }
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else {
            var currentSection = section - 1
            let currentMenuSection : MenuSection? = self.restaurant!.menuSections![0]
            return currentMenuSection!.itemArray!.count
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if let sectionInMenuSection = self.restaurant?.menuSections {
            return sectionInMenuSection.count + 1
        }
        else {
            return 0
        }
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch (indexPath.section){
        case Sections.Restaurant.rawValue:
            let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantCellIdentifier", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = "Gourmet"
            cell.textLabel?.font.fontWithSize(14.0)
        return cell
        
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("ItemCellIdentifier", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = self.restaurant!.menuSections![(indexPath.section)-1].itemArray?[indexPath.row].title
            cell.textLabel?.font.fontWithSize(9.0)
        return cell
        
    }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == Sections.Restaurant.rawValue{
        return "Restaurant"
        }else {
            return self.restaurant!.menuSections![section-1].name
        }
    }
}

