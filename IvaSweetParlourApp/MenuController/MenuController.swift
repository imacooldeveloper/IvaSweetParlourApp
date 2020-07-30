//
//  MenuController.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 4/17/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import UIKit
import Firebase


class MenuControllerss: UITableViewController{
    
    
    private let menuControllerCell = "menuControllerCell"
    
    var menu = [String]()
     var menucategory = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.register(MenuCell.self, forCellReuseIdentifier: menuControllerCell)
        fecthMenuCategory()
        self.tableView.separatorInset = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
            
//            UIEdgeInsets(top: 80, left: 80, bottom: 80, right: 80)
        
    }
    fileprivate func fecthMenuCategory() {
        
        Database.database().reference().child("Menu").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            print(snapshot.value )
            guard let menuDic = snapshot.value as? [String:Any] else {return}
            let menu = Menu(dictornary: menuDic)
            print(menu.category)
            
            self.menu.append(contentsOf: menu.category)
            self.menucategory.append(menu)
            self.tableView.reloadData()
        }) { (er) in
            print(er)
        }
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 10
       }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 80.0
       }
    
    
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//
//           let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 200, width: self.view.bounds.size.width, height: 10))
//           view.backgroundColor = .clear
//
//           return view
//       }
//    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menucategoryName = self.menu[indexPath.row]
        
        let categoryController = CategoryController(collectionViewLayout: UICollectionViewFlowLayout())
        categoryController.menucategoryName = menucategoryName
        
        let nav = UINavigationController(rootViewController: categoryController)
        
        categoryController.modalPresentationStyle = .fullScreen
        
        
        navigationController?.pushViewController(categoryController, animated: true)
//
//        self.present(nav, animated: true, completion: nil)
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuControllerCell, for: indexPath) as! MenuCell
        cell.menu = self.menu[indexPath.row]
       
        
        
//        cell.backgroundColor = #colorLiteral(red: 0.9989239573, green: 0.7055645585, blue: 0.7074396014, alpha: 1)
        return cell
    }
}
