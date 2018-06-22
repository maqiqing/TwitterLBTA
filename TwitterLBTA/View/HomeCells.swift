//
//  HomeCells.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/20.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import LBTAComponents

let twitterColor = UIColor(r: 61, g: 167, b: 244)

class UserHeader: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "WHO TO FOLLOW"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        self.separatorLineView.isHidden = false
        self.separatorLineView.backgroundColor = UIColor(r: 222, g: 222, b: 222)
        
        self.addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class UserFooter: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = twitterColor
        label.text = "Show me more"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        // make fake seperator in sections
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        
        self.addSubview(whiteBackgroundView)
        self.addSubview(textLabel)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {            
            guard let user = datasourceItem as? User else { return }
            
            nameLabel.text = user.name
            usernameLabel.text = user.userName
            bioTextView.text = user.bioText
            profileImageView.loadImage(urlString: user.profileImageUrl)
        }
    }
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "maqiqing"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@maqiqing"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.text = "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!"
        textView.backgroundColor = .clear
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterColor.cgColor
        button.layer.borderWidth = 1
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0)
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterColor, for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white

        self.separatorLineView.isHidden = false
        self.separatorLineView.backgroundColor = UIColor(r: 222, g: 222, b: 222)
        
        self.addSubview(profileImageView)
        self.addSubview(nameLabel)
        self.addSubview(usernameLabel)
        self.addSubview(bioTextView)
        self.addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)

        bioTextView.anchor(usernameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)

        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)

    }
}
