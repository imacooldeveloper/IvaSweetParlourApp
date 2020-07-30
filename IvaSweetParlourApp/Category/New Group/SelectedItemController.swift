//
//  SelectedItemController.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 5/21/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import UIKit

class SelectedItemController: UIViewController {
    var cookiesSelected: Cookies?{
        didSet{
            self.titleLab.text = cookiesSelected?.CookieName
            self.titleLabDiscription.text = cookiesSelected?.CookieDiscription
            self.price.text = cookiesSelected?.CookiePrice
        }
    }
   
    
    let titleLab = UILabel(text: "choclotae chip cookies", font: .systemFont(ofSize: 20, weight: .bold))
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
    
    var quanityPlace = PlaceHolders()
    
    lazy var minusBTN: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("-", for: .normal)
        btn.addTarget(self, action: #selector(handleMinusBtn), for: .touchUpInside)
        
        
        return btn
    }()
    
    lazy var PlusBTN: UIButton = {
          let btn = UIButton(type: .system)
          btn.setTitle("+", for: .normal)
          btn.addTarget(self, action: #selector(handlePlusBtn), for: .touchUpInside)
          
          
          return btn
      }()
    var count: Int?
    
    var totalprice: Float? = 0 {
           didSet {
               
               guard let totalprice = totalprice else { return }
               self.addtoCartBTN.setTitle("Add to cart - $\(totalprice)", for: .normal)
           }
       }
    
    var countClickedButtons : Int = 0 {
         didSet {
              let percent = Int(100.0 * Double(countClickedButtons) / 14.0)
              quanityPlace.text = String(countClickedButtons)
            guard let totalprice = totalprice else { return }
                          self.addtoCartBTN.setTitle("Add to cart - $\(totalprice)", for: .normal)
         }
    }
    @objc func handlePlusBtn() {
        print("hello")
     
        if PlusBTN.isSelected {
                countClickedButtons -= 1     // It will be deselected and count decreased by 1
           } else {
            countClickedButtons += 1    // It will be selected and count increased by 1
            print(countClickedButtons)
            let formatter = NumberFormatter()
                   formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
                   formatter.numberStyle = .decimal
                   let number = formatter.number(from: self.cookiesSelected?.CookiePrice ?? "") ?? 0
                   let times = self.countClickedButtons
                   
                   
                   
                   self.totalprice = Float(number) * Float(times)
        }
    }
    
    @objc func handleMinusBtn() {
         print("hello mmg")
        if minusBTN.isSelected == false{
            if countClickedButtons == 0 {
                
            } else {
                  countClickedButtons -= 1     // It will be deselected and count decreased by 1
                
                let formatter = NumberFormatter()
                       formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
                       formatter.numberStyle = .decimal
                       let number = formatter.number(from: self.cookiesSelected?.CookiePrice ?? "") ?? 0
                       let times = self.countClickedButtons
                       
                       
                       
                       self.totalprice = Float(number) * Float(times)
            }
                     
                  }
        
    }
    
    
    lazy var addtoCartBTN: AddToCartBTN = {
             let btn = AddToCartBTN(type: .system)
             btn.setTitle("Add to Cart", for: .normal)
             btn.addTarget(self, action: #selector(handleAddToCartBtn), for: .touchUpInside)
             
             
             return btn
         }()
    
    @objc func handleAddToCartBtn() {
        
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        let number = formatter.number(from: self.cookiesSelected?.CookiePrice ?? "") ?? 0
        let times = self.countClickedButtons
        
        
        
        self.totalprice = Float(number) * Float(times)
        
        
        
        
        print(price )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(titleLab)
        titleLab.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        titleLab.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(categoryPicture)
        categoryPicture.anchor(top: titleLab.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 30, bottom: 0, right: 30), size: .init(width: 0, height: 200))
        
        view.addSubview(titleLabDiscription)
        titleLabDiscription.anchor(top: categoryPicture.bottomAnchor, leading: categoryPicture.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        titleLabDiscription.numberOfLines = 10
        
//        titleLabDiscription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
        view.addSubview(price)
        price.anchor(top: titleLabDiscription.bottomAnchor, leading: titleLabDiscription.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        
        
        let purchaseStack = UIStackView(arrangedSubviews: [minusBTN,quanityPlace,PlusBTN])
        
        quanityPlace.text = "0"
        purchaseStack.spacing = 4
        purchaseStack.distribution = .fillEqually
        
        view.addSubview(purchaseStack)
        
        purchaseStack.anchor(top: price.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        purchaseStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(addtoCartBTN)
        addtoCartBTN.anchor(top: purchaseStack.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 30, bottom: 0, right: 30),size: .init(width: 0, height: 50))
        
        
    }
}
