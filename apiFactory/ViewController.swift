//
//  ViewController.swift
//  apiFactory
//
//  Created by Austin Formica on 12/18/15.
//  Copyright © 2015 citylims. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController:UITableViewController {
    
    var nameArray = [String]()
    var ageArray = [String]()
    var numRows = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        parseLocalJSON()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func parseLocalJSON(){
        
        let path : String = NSBundle.mainBundle().pathForResource("sampleJSON", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
    
        let users = readableJSON["Users"]
        let userCount = (users.count) - 1
        numRows = users.count
        
        for i in 0...userCount {
            var id = ""
            id += "\(i)"
            let name = readableJSON["Users"][id]["Name"].string!
            print(name)
            nameArray.append(name)
            let age = readableJSON["Users"][id]["Age"].string!
            print(age)
            ageArray.append(age)
        }
        
        print(nameArray)
        print(ageArray)
        
        
        NSLog("\(users)")

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numRows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        
        if nameArray.count != 0 {
            cell.textLabel?.text = nameArray[indexPath.row] + " " + ageArray[indexPath.row]
        }
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

