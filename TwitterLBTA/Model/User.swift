//
//  User.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/20.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let name: String
    let userName: String
    let bioText: String
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.userName = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
