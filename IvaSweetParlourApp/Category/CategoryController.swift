//
//  Category.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 5/21/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import UIKit
import Firebase

class CategoryController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    var menucategoryName: String?
    var cellid = "cellid"
    var cookiesArr = [Cookies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = menucategoryName ?? ""
       
        
            collectionView.backgroundColor = .white
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellid)
        fecthCookies()
    }
    
    func fecthCookies() {
        Database.database().reference().child("Cookies").observe( .childAdded, with: { (snap) in
            print(snap.value)
            guard let cookieDic = snap.value as? [String:Any] else { return }
            
            let cookies = Cookies(dictornary: cookieDic)
            self.cookiesArr.append(cookies)
            print(cookies.CookieDiscription)
            
            self.collectionView.reloadData()
        }) { (er) in
            print(er)
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 2, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cookiesArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cookiesSelected = self.cookiesArr[indexPath.row]
        
        
        let selecteditem = SelectedItemController()
        selecteditem.cookiesSelected = cookiesSelected
        
        navigationController?.pushViewController(selecteditem, animated: true)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! CategoryCell
       // cell.backgroundColor = .white
        
        cell.cookies = self.cookiesArr[indexPath.row]
        
        return cell
    }
}
