//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/21.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
        
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            
            let attributeText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = "  \(tweet.user.userName)\n"
            attributeText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.lightGray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            let range = NSMakeRange(0, attributeText.string.count)
            
            attributeText.addAttributes([NSAttributedStringKey.paragraphStyle: paragraphStyle], range: range)
            
            attributeText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributeText
        }
    }
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.text = "some example text.."
        textView.backgroundColor = .clear
        return textView
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        self.separatorLineView.isHidden = false
        self.separatorLineView.backgroundColor = UIColor(r: 222, g: 222, b: 222)
        
        self.addSubview(profileImageView)
        self.addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        setupBottonButtons()
    }
    
    
    fileprivate func setupBottonButtons() {
        
        let replyButtonContainerView = UIView()
        let retweetButtonContainerView = UIView()
        let likeButtonContainerView = UIView()
        let directMessageContainerView = UIView()
        
        replyButtonContainerView.addSubview(replyButton)
        retweetButtonContainerView.addSubview(retweetButton)
        likeButtonContainerView.addSubview(likeButton)
        directMessageContainerView.addSubview(directMessageButton)
        
        let stackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageContainerView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        directMessageButton.anchor(directMessageContainerView.topAnchor, left: directMessageContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
}
