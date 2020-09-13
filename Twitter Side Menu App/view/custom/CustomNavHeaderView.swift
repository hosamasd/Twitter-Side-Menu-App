//
//  CustomNavHeaderView.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CustomNavHeaderView: CustomBaseView {

    var delegate:HomeCollectionViewCell?{
        didSet{
            tapGes.addTarget(delegate, action: #selector(HomeCollectionViewCell.didImageTapped))
        }
    }
    
    let tapGes = UITapGestureRecognizer()
    
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var navTitle = UILabel(text: "Home", font: .systemFont(ofSize: 19), textColor: .black,textAlignment: .center)
    
    lazy var userImage:UIImageView = {
        let img = UIImageView(image: UIImage(named:"demo"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        img.isUserInteractionEnabled = true
        img.constrainWidth(constant: 30)
        img.constrainHeight(constant: 30)
        img.addGestureRecognizer(tapGes)
        return img
    }()
    
    lazy var dividerView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColors.appExtraLightGray
        v.constrainHeight(constant: 0.7)
        return v
    }()
    
    override func setupViews() {
        
        let ss = hstack(userImage,navTitle)
        
        
        addSubview(cardView)
        cardView.fillSuperview()
        
        cardView.stack(UIView(),ss).withMargins(.allSides(8))
        
    }
    
}
