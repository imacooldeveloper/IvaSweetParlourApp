//
//  ViewExtentions.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 4/17/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerXInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    
    func centerYInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    
}

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}
extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init()
        self.text = text
        self.font = font
    }
}
class PlaceHolders: UITextField {
 override init(frame: CGRect) {
     super.init(frame: frame)
     
     contentMode = .center
     borderStyle = .roundedRect
     backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
     
 }
 
 required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
 }
 

 }
class AddToCartBTN: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
       
               
                
                backgroundColor = #colorLiteral(red: 0.516300559, green: 0.8177587986, blue: 0.6682328582, alpha: 1)
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
               layer.cornerRadius = 10
                layer.shadowColor = UIColor.black.cgColor
                   layer.shadowOffset = CGSize(width: 2, height: 2)
                   layer.shadowRadius = 5
                   layer.shadowOpacity = 1.0
              
                
             

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
