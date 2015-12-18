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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parseLocalJSON()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func parseLocalJSON(){
        
        let path : String = NSBundle.mainBundle().pathForResource("sampleJSON", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
    
        var users = readableJSON["Users"]
        NSLog("\(users)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

