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
    }
    
    func parseLocalJSON(){
        let path : String = NSBundle.mainBundle().pathForResource("sampleJSON", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)

        let users = readableJSON["Users"]
        numRows = users.count // for UITableView
        
        //(JS..feels)
        for var i = 0; i < users.count; i++ {
            // ok back to swift :)
            var id = ""
            id += "\(i)"
            let name = users[id]["Name"].string!
            let age = users[id]["Age"].string!
            nameArray.append(name)
            ageArray.append(age)
        }
        
        print(nameArray)
        print(ageArray)
        NSLog("\(users)")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //define number of rows per logic
        return numRows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //assign cell to identifier in storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        
        //print out the list --- this is wow.
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

