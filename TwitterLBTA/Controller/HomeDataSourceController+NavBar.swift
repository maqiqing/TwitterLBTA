//
//  HomeDataSourceController+NavBar.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/21.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
    
    func setupNavigationBarItems(){
        setupRemainingNavItems()
        setupLeftNavItem()
        setupRightNavItem()
    }
    
    private func setupRemainingNavItems() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        // 改变navigationBar下面的分割线
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let seperatorLineView = UIView()
        seperatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(seperatorLineView)
        seperatorLineView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        /*
         navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
         let searchBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
         let composeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
         navigationItem.rightBarButtonItems = [searchBarButtonItem, composeBarButtonItem]
         */
    }
    
    private func setupLeftNavItem() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItem() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    
}
