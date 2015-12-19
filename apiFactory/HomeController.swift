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

class HomeController:UIViewController {
       
    
    @IBOutlet weak var profile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foo()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func foo(){
        Alamofire.request(.GET, apiUrl).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let picUrl = json["url"].string!
                    print(picUrl)
                    self.profile.imageFromUrl(picUrl)
                    
                    //
                }
            case .Failure(let error):
                print(error)
            }
        }
    }

    
    
    
    
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
