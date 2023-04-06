//
//  ShoppingCart.swift
//  0706012110018-Vebrillia Santoso-AFL 1
//
//  Created by MacBook Pro on 05/04/23.
//

import Foundation


class cart: payment {
    
    func total(totalPay: Int) {
        while !isPaymentValid {
                print("""
                  
                  Your total order: \(cartTotal.formatted())
                  Enter the amount of your money :
                  """, terminator: " ")
        
                let input = readLine()
                if let amount = Int(input!) {
                    if amount == 0{
                        print("Payment can't be zero.")
                        continue
                    } else if amount < 0{
                        print("Please enter a valid amount.")
                        continue
                    } else if amount < cartTotal{
                        print("Please enter a valid amount.")
                        continue
                    }
                    pembayaran = (Int(amount))
                } else {
                    if input == ""{
                        print("Please enter your payment.")
                    } else {
                        print("Please enter a valid amount.")
                    }
        
                    continue
                }
        
        
                isPaymentValid = true
        
                let change = pembayaran - cartTotal
                print("Your total order: \(cartTotal)")
                print("You pay: \(pembayaran) Change: \(change)")
        
                print("""
                      Enjoy your meals!
                      Press [return] to go back to main screen:
                      """)
        
                choose = readLine()!
        
            }
            isPaymentValid = false
            cartTotal = 0
            pembayaran = 0
            listItem = []
    }
    
    var listItem : [item] = []
    var total : Int = 0
    
    init(){
        
    }
    
    init(total: Int, listItem : [item]) {
        self.listItem = listItem
        self.total = total
    }
    
    func addItem(tempItem: item){
        listItem.append(tempItem)
    }

    func PrintItem(){
        if self.listItem.isEmpty{
            print("Your cart is empty")
            welcome().mainScreen()
        }else{
//            for item in self.listItem{
//                print(
//                """
//
//                Your Order From \(item.shopName) :
//                """)
//
//                for itemm in self.listItem{
//                        if item.shopName == itemm.shopName{
//                            print("- \(item.name) x \(item.amount)")
//                        }
//
//                }
//
//            }
            var storeItems: [String: [String: Int]] = [:]
            for item in self.listItem {
                       if storeItems[item.shopName] == nil {
                           storeItems[item.shopName] = [item.name: item.amount]
                       } else if storeItems[item.shopName]![item.name] == nil {
                           storeItems[item.shopName]![item.name] = item.amount
                       } else {
                           storeItems[item.shopName]![item.name]! += item.amount
                       }
                   }
                   
                   for (storeName, items) in storeItems {
                       print()
                       print("Your order from \(storeName):")
                       for (itemName, quantity) in items {
                           print("- \(itemName) x\(quantity)")
                       }
                   }
            print(
            """
            Press [B] to go back
            Press [P] to pay/checkout
            Your choice?
            """,terminator: " ")
            
        }
        
    }
}



