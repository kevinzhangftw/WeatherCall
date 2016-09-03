//
//  ViewController.swift
//  WeatherCall
//
//  Created by Kevin Zhang on 2016-08-23.
//  Copyright © 2016 Kevin Zhang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    typealias Payload = [String: AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alamofireCall()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController{

    func alamofireCall(){
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather?q=vancouver&APPID=69c420e9a25ddd533c15ee9596f7db87")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    print("Validation Successful")
                    print(response.result)
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                    let responseJSON = response.result.value as? [String: AnyObject]
                    
                    
                    
                    
                case .Failure(let error):
                    print(error)
                }
        }
//            .responseData { response in
//                print(response.request)
//                print(response.response)
//                print(response.result)
//        }

    }
}


