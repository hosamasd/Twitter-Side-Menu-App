//
//  UIImageView.swift
//  MapKitSwiftUI
//
//  Created by hosam on 6/21/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit
extension UIImageView {
    convenience public init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.init(image: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
    
    func enableZoom() {
           let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
           isUserInteractionEnabled = true
           addGestureRecognizer(pinchGesture)
       }
       
       @objc
       fileprivate func startZooming(_ sender: UIPinchGestureRecognizer) {
           let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
           guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
           sender.view?.transform = scale
           sender.scale = 1
       }
    
    
}

@available(iOS 9.0, *)
open class CircularImageView: UIImageView {
    
    public init(width: CGFloat, image: UIImage? = nil) {
        super.init(image: image)
        contentMode = .scaleAspectFill
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        clipsToBounds = true
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}


open class AspectFitImageView: UIImageView {
    
    convenience public init(image: UIImage? = nil, cornerRadius: CGFloat = 0) {
        self.init(image: image)
        self.layer.cornerRadius = cornerRadius
    }
    
    convenience public init() {
        self.init(image: nil)
    }
    
    override public init(image: UIImage?) {
        super.init(image: image)
        contentMode = .scaleAspectFit
        clipsToBounds = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

open class AspectFillImageView: UIImageView {
    convenience public init() {
        self.init(image: nil)
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
