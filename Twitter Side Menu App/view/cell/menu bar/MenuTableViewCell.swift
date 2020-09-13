//
//  MenuTableViewCell.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    var data:SideMenuData?{
        didSet {
            manageData()
        }
    }
    
    lazy var imgView : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    lazy var titleLabel:UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "HelveticaNeue", size: 20)
        l.textColor = CustomColors.appBlack
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imgView)
        addSubview(titleLabel)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            imgView.widthAnchor.constraint(equalToConstant: 30),
            imgView.heightAnchor.constraint(equalToConstant: 30),
            imgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant:20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func manageData(){
        guard let data = data else {return}
        imgView.image = UIImage(named: data.img)
        titleLabel.text = data.label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
