//
//  BaseCollectionCell.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()  {
        
    }
}
