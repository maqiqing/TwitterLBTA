//
//  HomeDataSource.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/20.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{try T(json: $0)}
    }
}

class HomeDataSource: Datasource, JSONDecodable {
    
    /*
    let users: [User] = {
        let matouUser = User(name: "马头", userName: "@maqiqing", bioText: "This is a test bioText.", profileImage: #imageLiteral(resourceName: "profile_image"))
        let brainUser = User(name: "Brain Voong", userName: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        let rayUser = User(name: "Ray Wenderlich", userName: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topic.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        return [matouUser,brainUser,rayUser]
    }()
    */
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        
        guard let userJsonArray = json["users"].array, let tweetJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing Json was  not valid."])
        }
        
        self.users = userJsonArray.map({User(json: $0)})
        self.tweets = tweetJsonArray.map({Tweet(json: $0)})
        /*
        var users = [User]()
        let array = json["users"].array
        for userJson in array! {
            let user = User(json: userJson)
            users.append(user)
        }
         
        var tweets = [Tweet]()
        let tweetJsonArray = json["tweets"].array
        for tweetJson in tweetJsonArray! {
        let userJson = tweetJson["user"]
        let user = User(json: userJson)
        let message = tweetJson["message"].stringValue
         
        let tweet = Tweet(user: user, message: message)
        tweets.append(tweet)
        }
        */
        
        /*
         // 要在User和Tweet模型中import TRON并遵守JSONDecodable
         self.users = try usersJsonArray.decode()
         self.tweets = try tweetsJsonArray.decode()
         */
    }

    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }
        return users[indexPath.row]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    // header and footer
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
}

