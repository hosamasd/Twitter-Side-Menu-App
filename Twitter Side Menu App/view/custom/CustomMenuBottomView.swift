//
//  CustomMenuBottomView.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CustomMenuBottomView: CustomBaseView {

    var delegate:MenuBarCollectionViewCell?
    
    lazy var darkToggleBtn:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "dark")
        img.constrainWidth(constant: 30)
        img.constrainHeight(constant: 30)
        return img
    }()
    
    lazy var qrCodeBtn:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "qrcode")
        img.constrainWidth(constant: 30)
        img.constrainHeight(constant: 30)
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
        
        let ff = hstack(darkToggleBtn,UIView(),qrCodeBtn).withMargins(.allSides(16))
        
        stack(dividerView,ff)
        
//        addSubview(darkToggleBtn)
//        addSubview(qrCodeBtn)
//        addSubview(dividerView)
//        setUpConstraints()
    }
    
//    func setUpConstraints(){
//        NSLayoutConstraint.activate([
//            darkToggleBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
//            darkToggleBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
//            darkToggleBtn.widthAnchor.constraint(equalToConstant: 30),
//            darkToggleBtn.heightAnchor.constraint(equalToConstant: 30),
//
//            qrCodeBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
//            qrCodeBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
//            qrCodeBtn.widthAnchor.constraint(equalToConstant: 30),
//            qrCodeBtn.heightAnchor.constraint(equalToConstant: 30),
//
//            dividerView.topAnchor.constraint(equalTo: topAnchor),
//            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            dividerView.heightAnchor.constraint(equalToConstant: 1)
//        ])
//    }
    
    
}
