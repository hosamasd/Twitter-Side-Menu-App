//
//  MenuSimpleTableViewCell.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class MenuSimpleTableViewCell: BaseTableViewCell {

    var data:SideMenuData?{
        didSet {
            manageData()
        }
    }
    
    lazy var titleLabel:UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "HelveticaNeue", size: 20)
        l.textColor = CustomColors.appBlack
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override func setupViews() {
        
        addSubview(titleLabel)
      
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func manageData(){
        guard let data = data else {return}
        titleLabel.text = data.label
    }
    
    
}
