//
//  MenuCell.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 4/17/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    var menu: String? {
        didSet {
            guard let menuName = menu else { return }
//
//
            for menu in menuName {
                 self.menuName.text = menuName
            }
            
        }
    }
    
    
    var menuPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
//        imageView.layer.cornerRadius = 42.0
//            imageView.layer.masksToBounds = true
         //or

        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var menuBackgroundView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true

        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.23
        view.layer.shadowRadius = 4
        return view
    }()
    
    
    var menuName = UILabel(text: "", font: UIFont.boldSystemFont(ofSize: 25))
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
           
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = #colorLiteral(red: 0.9989239573, green: 0.7055645585, blue: 0.7074396014, alpha: 1)
        contentView.layer.cornerRadius = 8
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 80, left: 80, bottom: 80, right: 80))
//        addSubview(menuBackgroundView)
//        menuBackgroundView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
      addSubview(menuPicture)
        menuPicture.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 10, left: 10, bottom: 10, right: 0), size: .init(width: 82, height: 0))
        
        addSubview(menuName)
        menuName.textAlignment = .center
        menuName.textColor = #colorLiteral(red: 0.6295551062, green: 1, blue: 0.8291313052, alpha: 1)
        menuName.anchor(top: menuPicture.topAnchor , leading: menuPicture.trailingAnchor, bottom: menuPicture.bottomAnchor, trailing: nil, padding: .init(top: 20, left: 50, bottom: 10, right: 0), size: .init(width: 0, height: 0))
//        let padding = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
//        bounds = bounds.inset(by: padding)
//
//        menuPicture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        bounds = bounds.inset(by: padding)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
