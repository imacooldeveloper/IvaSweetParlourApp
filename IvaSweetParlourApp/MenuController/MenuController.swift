//
//  MenuController.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 4/17/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import UIKit

class MenuControllerss: UITableViewController{
    
    
    private let menuControllerCell = "menuControllerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5498679876, green: 0.8166012764, blue: 0.7029016614, alpha: 1)
        tableView.register(MenuCell.self, forCellReuseIdentifier: menuControllerCell)
        
        
    }
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 80.0
       }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

           let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
           view.backgroundColor = .clear

           return view
       }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuControllerCell, for: indexPath) as! MenuCell
        
        
        
        cell.menuName.text = "CupCake"
        cell.backgroundColor = #colorLiteral(red: 0.9989239573, green: 0.7055645585, blue: 0.7074396014, alpha: 1)
        return cell
    }
}
