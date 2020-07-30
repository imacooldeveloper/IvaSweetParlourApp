//
//  Menu.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 5/21/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import UIKit

struct Menu {
    var category = [String]()
    var categoryImages = [String]()
    var categoryName: String?
    var FacilitySummary = [String]()

  init(dictornary:[String:Any]) {
    category = dictornary["Category"] as? [String ] ?? []
    
    FacilitySummary = dictornary["FacilitySummary"] as? [String ] ?? []
    categoryImages = dictornary["categoryImages"] as? [String ] ?? []
    
    categoryName =  dictornary["categoryName"] as? String  ?? ""
    
}
       
}
