//
//  Cookies.swift
//  IvaSweetParlourApp
//
//  Created by Martin Gallardo on 5/21/20.
//  Copyright © 2020 Martin Gallardo. All rights reserved.
//

import Foundation

struct Cookies {
    var CookieDiscription: String
    var CookieImage: String
    var CookieName: String
    var CookiePrice: String
    init(dictornary:[String:Any]) {
        CookieDiscription = dictornary["CookieDiscription"] as? String  ?? ""
        CookieImage = dictornary["CookieImage"] as? String  ?? ""
        CookieName = dictornary["CookieName"] as? String  ?? ""
        CookiePrice = dictornary["CookiePrice"] as? String  ?? ""
    }
}
