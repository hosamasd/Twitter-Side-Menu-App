//
//  CustomMenuHeaderView.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CustomMenuHeaderView: CustomBaseView {
    
    var delegate:MenuBarCollectionViewCell?
    
    lazy var imageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.image = UIImage(named: "demo")
        img.layer.cornerRadius = 30
        img.constrainWidth(constant: 60)
        img.constrainHeight(constant: 60)
        return img
    }()
    
    lazy var userDetail:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.textColor = CustomColors.appBlack
        return l
    }()
    
    lazy var moreBtn:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "more")
        img.constrainWidth(constant: 35)
        img.constrainHeight(constant: 35)
        return img
    }()
    
    lazy var dividerView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColors.appExtraLightGray
        v.alpha = 0
        v.constrainHeight(constant: 1)
        return v
    }()
    
    override func setupViews() {
        let top = hstack(imageView,UIView(),moreBtn)
        stack(top,userDetail,spacing:8).withMargins(.allSides(8))
        
        addSubview(dividerView)
        
        dividerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        setUpAttributes()
    }
    
    func setUpAttributes(){
        let attributedText = NSMutableAttributedString(string:"Dheeraj\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 23)!])
        
        attributedText.append(NSAttributedString(string: "@dheerajdev_twit\n\n" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18) , NSAttributedString.Key.foregroundColor: CustomColors.appDarkGray]))
        
        attributedText.append(NSAttributedString(string: "41" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: " Following  " , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18) , NSAttributedString.Key.foregroundColor: CustomColors.appDarkGray]))
        
        attributedText.append(NSAttributedString(string: "15" , attributes:[NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: " Followers" , attributes:[NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18) , NSAttributedString.Key.foregroundColor: CustomColors.appDarkGray]))
        
        userDetail.attributedText = attributedText
    }
  
    
}
