//
//  ViewController.swift
//  demo
//
//  Created by Vinsofts on 11/19/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class homeModel: Mappable {
    var bla: bla?
    var message: String?
    var status: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        bla <- map["bla"]
        message <- map["message"]
        status <- map["status"]
    }
}

class bla: Mappable {
    var title: String?
    var types: [TYPE]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        types <- map["types"]
    }
}

class TYPE: Mappable {
    var id: Int?
    var image: String?
    var title: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        image <- map["image"]
        title <- map["title"]
    }
}

class ViewController: UIViewController {
    
    var url = URL(string: "http://127.0.0.1:5000/Home")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tappe(_ sender: Any) {
//        AF.request(url!).response { (response) in
//            switch response.result {
//            case .success(let responString):
//                print("succ")
//                print(responString)
//                if let allData = responString?.hashValue as! [String: Any]? {
//                    print(allData)
//                }
//            case .failure(_):
//                print("err")
//            }
//        }
        DataService.shareIntance.getdataFromApi { (data) in
            print(data)
        }
    }
    

}


class DataService {
    
    static let shareIntance: DataService = DataService()
    
    func getdataFromApi(complateHandle: @escaping(homeModel) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:5000/Home") else { return }
        
        AF.request(url).responseString { reponse in
            switch (reponse.result) {
            case .success(let responseString):
               // print(responseString)
                guard let weatherResponse = homeModel(JSONString: "\(responseString)") else { return }
                DispatchQueue.main.async {
                    complateHandle(weatherResponse)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
