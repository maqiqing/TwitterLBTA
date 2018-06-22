//
//  Service.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/22.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {

    static let sharedInstance = Service()
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com/")

    // MARK: - 网络获取
    // https://api.letsbuildthatapp.com/twitter/home
    func fetchHomeFeed(completion: @escaping (HomeDataSource?, Error?) -> ()) {
        // start json fetch
        let request:APIRequest<HomeDataSource, JSONError> = tron.swiftyJSON.request("twitter/home")//"twitter/home_with_error"
        request.perform(withSuccess: { homeDataSource in
            print("Received homeDataSource: \(homeDataSource)")
            
            completion(homeDataSource, nil)
            
        }, failure: { error in
            print("User request failed, parsed error: \(error)")
            
            completion(nil, error)
        })
//        URLSession.shared.dataTask(with: "") { (data, urlResponse, error) in print(data)}
    }
    
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("error..\n",json)
        }
    }
}
