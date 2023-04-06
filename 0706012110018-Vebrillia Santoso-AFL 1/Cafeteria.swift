//
//  Cafeteria.swift
//  0706012110018-Vebrillia Santoso-AFL 1
//
//  Created by MacBook Pro on 05/04/23.
//

import Foundation

class cafeteria {
    var name: String = ""
    var menu:[menu] = []
    
    init(name: String, menu: [menu]) {
        self.name = name
        self.menu = menu
    }
    
    func PrintMenu(){
        var counter = 1
        for item in self.menu{
            print(
            """
            [\(counter)] \(item.name) harga \(item.price.formatted())
            """)
            counter+=1
        }
        print(
        """
        Press [B]ack
        your choice?
        """,terminator: " ")
    }
    
//    func menuChosen(){
//        for item in self.menu{
//            
//        }
//    }
}
