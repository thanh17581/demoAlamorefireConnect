//
//  ViewController.swift
//  demo
//
//  Created by Vinsofts on 11/19/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var url = URL(string: "http://127.0.0.1:5000/Home")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tappe(_ sender: Any) {
        AF.request(url!).response { (response) in
            switch response.result {
            case .success(_):
                print("succ")
            case .failure(_):
                print("err")
            }
        }
    }
    

}

