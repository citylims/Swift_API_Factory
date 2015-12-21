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
        getUser("872")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUser(id: String){
        var requestUrl: String = ApiInfo.apiUrl
        let query: String = "/v1/user/"
        requestUrl += query
        requestUrl += id
        print(requestUrl)
        Alamofire.request(.GET, requestUrl).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print(json)
                    let picUrl = json["url"].string!
//                    let rate :Int? = json["rating"].int
//                    let userName = json["userName"].string!
//                    let userNameArr = userName.componentsSeparatedByString(" ")
//                    let firstNameU: String? = userNameArr[0]
//                    let lastName: String? = userNameArr[1]
//                    print(rate!)
//                    print(picUrl)
                    self.profile.imageFromUrl(picUrl)
                    self.defineUser(json)
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    
    func defineUser(data: JSON) {
        print(data)
        let userName = data["userName"].string!
        let splitArr = userName.componentsSeparatedByString(" ")
        let fName = splitArr[0]
        let lName = splitArr[1]
        let email = data["email"].string!
        let picture = data["url"].string!
        let fooUser = User(firstName: fName, lastName: lName, email: email, picture: picture)
        print(fooUser)
        scopeUser(fooUser)
    
        
    }
    
    func scopeUser(currentUser: User) {
        print(currentUser.firstName)
    
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
