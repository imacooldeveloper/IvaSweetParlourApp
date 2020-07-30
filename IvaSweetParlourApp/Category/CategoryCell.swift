//
//  CategoryCell.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 5/21/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    
    var cookies: Cookies? {
        didSet {
            guard let cookies = cookies else { return }
            
            titleLab.text = cookies.CookieName
            titleLabDiscription.text = cookies.CookieDiscription
            price.text = cookies.CookiePrice
        }
    }
    
    let titleLab = UILabel(text: "choclotae chip cookies", font: .systemFont(ofSize: 20, weight: .thin))
    let titleLabDiscription = UILabel(text: "is delicious", font: .systemFont(ofSize: 20, weight: .thin))
    let price = UILabel(text: "$3.21", font: .systemFont(ofSize: 20, weight: .thin))
    
     var categoryPicture: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .red
    //        imageView.layer.cornerRadius = 42.0
    //            imageView.layer.masksToBounds = true
             //or

            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.clipsToBounds = true
            return imageView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//
//        backgroundColor = .clear // very important
//        layer.masksToBounds = false
//        layer.shadowOpacity = 0.23
//        layer.shadowRadius = 4
//        layer.shadowOffset = CGSize(width: 0, height: 0)
//        layer.shadowColor = UIColor.black.cgColor
       // contentView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//               contentView.layer.cornerRadius = 8
        
        addSubview(categoryPicture)
        categoryPicture.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 10),size: .init(width: 80, height: 80))
        
        addSubview(titleLab)
        titleLab.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        addSubview(titleLabDiscription)
        titleLabDiscription.anchor(top: titleLab.bottomAnchor, leading: titleLab.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        
        addSubview(price)
        price.anchor(top: titleLabDiscription.bottomAnchor, leading: titleLab.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        
        let line = UILabel()
        line.backgroundColor = .black
        addSubview(line)
        line.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 30, bottom: 0, right: 0),size: .init(width: 0, height: 1))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
