//
//  Tweet.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/21.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
