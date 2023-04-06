//
//  Item.swift
//  0706012110018-Vebrillia Santoso-AFL 1
//
//  Created by MacBook Pro on 05/04/23.
//

import Foundation

class item: menu{
    var amount: Int
    
    init(_ name: String, price: Int, shopName : String, bonus amount: Int) {
        self.amount = amount
        super.init(name: name, price: price, shopName: shopName)
    }
    
}
