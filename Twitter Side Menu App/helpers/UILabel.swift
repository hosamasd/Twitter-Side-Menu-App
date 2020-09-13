//
//  UILabel.swift
//  MapKitSwiftUI
//
//  Created by hosam on 6/21/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

extension UILabel{
    
    func underline() {
           if let textString = self.text {
               let attributedString = NSMutableAttributedString(string: textString)
               attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
               attributedText = attributedString
           }
       }
       
       //for padding
       
       private struct AssociatedKeys {
           static var padding = UIEdgeInsets()
       }
       
       public var padding: UIEdgeInsets? {
           get {
               return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
           }
           set {
               if let newValue = newValue {
                   objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
               }
           }
       }
       
       override open func draw(_ rect: CGRect) {
           if let insets = padding {
               self.drawText(in: rect.inset(by: insets))
           } else {
               self.drawText(in: rect)
           }
       }
       
       override open var intrinsicContentSize: CGSize {
           guard let text = self.text else { return super.intrinsicContentSize }
           
           var contentSize = super.intrinsicContentSize
           var textWidth: CGFloat = frame.size.width
           var insetsHeight: CGFloat = 0.0
           var insetsWidth: CGFloat = 0.0
           
           if let insets = padding {
               insetsWidth += insets.left + insets.right
               insetsHeight += insets.top + insets.bottom
               textWidth -= insetsWidth
           }
           
           let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
                                           options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                           attributes: [NSAttributedString.Key.font: self.font], context: nil)
           
           contentSize.height = ceil(newSize.size.height) + insetsHeight
           contentSize.width = ceil(newSize.size.width) + insetsWidth
           
           return contentSize
       }

       
       
       convenience public init(text: String?, font: UIFont? = UIFont.systemFont(ofSize: 14), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
           self.init()
           self.text = text
           self.font = font
           self.textColor = textColor
           self.textAlignment = textAlignment
           self.numberOfLines = numberOfLines
       }
       
       func animate(newText: String, characterDelay: TimeInterval) {
           
           DispatchQueue.main.async {
               
               self.text = ""
               
               for (index, character) in newText.enumerated() {
                   DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                       self.text?.append(character)
                   }
               }
           }
       }
}

extension String {
    func height(withWidth width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font : font], context: nil)
        return actualSize.height
    }
}
