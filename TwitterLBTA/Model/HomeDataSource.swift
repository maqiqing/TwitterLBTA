//
//  HomeDataSource.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/20.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let matouUser = User(name: "马头", userName: "@maqiqing", bioText: "This is a test bioText.", profileImage: #imageLiteral(resourceName: "profile_image"))
        let brainUser = User(name: "Brain Voong", userName: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        let rayUser = User(name: "Ray Wenderlich", userName: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topic.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        return [matouUser,brainUser,rayUser]
    }()
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.row]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
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
