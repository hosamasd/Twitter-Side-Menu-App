//
//  HomeFeedTableViewCell.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class HomeFeedTableViewCell: BaseTableViewCell {

    var data:UserTwit?{
        didSet{
            manageData()
        }
    }
    
    lazy var userImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .lightGray
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 22.5
        img.clipsToBounds = true
        img.constrainWidth(constant: 45)
        img.constrainHeight(constant: 45)
        return img
    }()
    
    lazy var stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.spacing = 10
        v.distribution = .fillEqually
        v.axis = .horizontal
        return v
    }()
    
    //MARK:- Comment View
    lazy var commentView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.hstack(commentImage,commentLabel,spacing:4)
        return v
    }()
    
    lazy var commentImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"comment")
        img.constrainWidth(constant: 20)
                      img.constrainHeight(constant: 20)
        return img
    }()
    
    lazy var commentLabel:UILabel = {
        let l = UILabel()
        l.text = "34"
        l.font = UIFont(name: "HelveticaNeue", size: 15)
        l.textColor = CustomColors.appDarkGray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- Retweet View
    
    lazy var retweetView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.hstack(retweetImage,retweetLabel,spacing:4)
        return v
    }()
    
    lazy var retweetImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"retweet")
        img.constrainWidth(constant: 20)
               img.constrainHeight(constant: 20)
        return img
    }()
    
    lazy var retweetLabel:UILabel = {
        let l = UILabel()
        l.text = "34"
        l.font = UIFont(name: "HelveticaNeue", size: 15)
        l.textColor = CustomColors.appDarkGray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- Like View
    
    lazy var likeView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.hstack(likeImage,likeLabel,spacing:4)
        return v
    }()
    
    lazy var likeImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"heart")
        img.constrainWidth(constant: 20)
               img.constrainHeight(constant: 20)
        return img
    }()
    
    lazy var likeLabel:UILabel = {
        let l = UILabel()
        l.text = "34"
        l.font = UIFont(name: "HelveticaNeue", size: 15)
        l.textColor = CustomColors.appDarkGray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- Share View
    
    lazy var shareView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
//        v.hstack(shareImage,likeLabel)
        return v
    }()
    
    lazy var shareImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"share")
        img.constrainWidth(constant: 20)
               img.constrainHeight(constant: 20)
        return img
    }()
    
    lazy var userInfo:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var userTweet:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.font = UIFont(name: "HelveticaNeue", size: 17)
        l.textColor = CustomColors.appBlack
        return l
    }()
    
    override func setupViews() {
        
   
        let top = stack(userImage,UIView())
        let bottom = hstack(commentView,likeView,retweetView,shareImage,UIView(),spacing:16)
        
        hstack(top,stack(userInfo,userTweet,bottom,spacing:8),spacing:8).withMargins(.allSides(16))
        
        
    }
    
    
    func manageData(){
        guard let data = data else {return}
        userImage.image = UIImage(named: data.userImage)
        likeLabel.text = data.like
        commentLabel.text = data.comment
        retweetLabel.text = data.retweet
        userTweet.text = data.tweet
        setUpAttributes(data.name, data.userName, data.time)
    }
    
    func setUpAttributes( _ name:String, _ userName:String , _ time:String){
        let attributedText = NSMutableAttributedString(string:"\(name) " , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])
        
        attributedText.append(NSAttributedString(string: "@\(userName)" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17) , NSAttributedString.Key.foregroundColor: CustomColors.appDarkGray]))
        
        attributedText.append(NSAttributedString(string: " . \(time)" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: CustomColors.appDarkGray]))
        
        userInfo.attributedText = attributedText
    }
   
    
}
