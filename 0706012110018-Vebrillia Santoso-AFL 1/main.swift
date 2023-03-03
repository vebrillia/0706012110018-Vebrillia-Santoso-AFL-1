//
//  main.swift
//  0706012110018-Vebrillia Santoso-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var userInput: String = ""
var cafetaria = ["Tuku-Tuku", "Gotri", "Madam Lie", "Kopte", "E&W"]
var tukuTukuMenu = ["Tahu isi", "Nasi Kuning", "Nasi Campur", "Air Mineral"]
var tukuTukuHarga = [15000, 20000, 25000, 5000]
var shoppingCart: [String] = []
var cartTotal: Int = 0
var cartFrom: [String] = []
var payment: Int = 0
var isPaymentValid = false
var totalOrder: Int

welcomeScreen()

func welcomeScreen(){
    print("""
          Welcome to UC-Walk Cafetaria 👩🏻‍🍳👨🏻‍🍳
          Please choose cafetaria :
          """)
    
    for(index, item) in cafetaria.enumerated(){
        print("[\(index+1)] \(item)")
    }
    
    print("""
          -
          [S]hopping Cart
          [Q]uit
          Your cafetaria choice?
          """, terminator: " ")
    
    
    userInput = readLine()!.lowercased()
        
    switch userInput {
    case "1" :
        tukuTuku()
        break
    case "2" :
        break
    case "3" :
        break
    case "4" :
        break
    case "s" :
        shopping()
        welcomeScreen()
    case "q" :
        exit(0)
    default:
        welcomeScreen()
    }
}

func shopping(){
    if shoppingCart.isEmpty{
        print("""
              
              Your cart is empty.
              
              """)
    }else{
        for (index, item) in cartFrom.enumerated(){
            print("""
              
              Your order from \(item)
              - \(shoppingCart[index])
              """)
        }
        print("""
              
              Press [B] to go back
              Press [P] to pay / checkout
              Your choise?
              """)
        
        userInput = readLine()!.lowercased()
        
        switch userInput{
        case "b" :
            welcomeScreen()
        case "p" :
            checkout()
        default :
            welcomeScreen()
        }
    }
        
}

func checkout(){
    
    
    
    while !isPaymentValid {
        print("""
          
          Your total order: \(cartTotal.formatted())
          Enter the amount of your money :
          """, terminator: " ")
        
        guard let input = readLine(),
              let amount = Int(input) else {
            print("Please enter a valid amount.")
            continue
        }
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
        
        payment = (Int(amount))
        isPaymentValid = true
        
        let change = payment - cartTotal
        print("Your total order: \(cartTotal)")
        print("You pay: \(payment) Change: \(change)")
        
        print("""
              
              Enjoy your meals!
              
              Press [return] to go back to main screen:
              """)
        
        userInput = readLine()!
        
        
        
    }
    
    
    isPaymentValid = false
    cartTotal = 0
    payment = 0
    cartFrom = []
    shoppingCart = []

    welcomeScreen()
    
}


func tukuTuku(){
    print("""
          
          Hi, Welcome back to Tuku-Tuku!
          What would you like to order?
          
          """)
    
    for(index, menu) in tukuTukuMenu.enumerated(){
        print("[\(index+1)] \(menu)")
    }
            
    print("""
          -
          [B]ack to Main Menu
          Your menu choice?
          """, terminator: " ")
    
    
    userInput = readLine()!.lowercased()
    
    switch userInput {
    case "1" :
        print("""
              
              \(tukuTukuMenu[0]) @ \(tukuTukuHarga[0].formatted())
              How many Tahu Isi do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = tukuTukuHarga[0] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(tukuTukuMenu[0]) @ \(harga.formatted())")
        
        cartFrom.append("Tuku-Tuku")
//        cartTotal.append(harga)
        cartTotal += harga
        
//        for items in shoppingCart{
//            print(items)
//        }
        tukuTuku()
        
    case "2" :
        print("""
              
              \(tukuTukuMenu[1]) @ \(tukuTukuHarga[1].formatted())
              How many Nasi Kuning do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = tukuTukuHarga[1] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(tukuTukuMenu[1]) @ \(harga.formatted())")
        
        cartFrom.append("Tuku-Tuku")
//        cartTotal.append(harga)
        cartTotal += harga
        
        tukuTuku()
        
    case "3" :
        print("""
              
              \(tukuTukuMenu[2]) @ \(tukuTukuHarga[2].formatted())
              How many Nasi Campur do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = tukuTukuHarga[2] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(tukuTukuMenu[2]) @ \(harga.formatted())")
        
        cartFrom.append("Tuku-Tuku")
//        cartTotal.append(harga)
        cartTotal += harga
        
        tukuTuku()
        
    case "4" :
        print("""
              
              \(tukuTukuMenu[3]) @ \(tukuTukuHarga[3].formatted())
              How many Air Mineral do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = tukuTukuHarga[3] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(tukuTukuMenu[3]) @ \(harga.formatted())")
        
        cartFrom.append("Tuku-Tuku")
//        cartTotal.append(harga)
        cartTotal += harga
        
        tukuTuku()
        
    case "b" :
        welcomeScreen()
    default:
        tukuTuku()
    }
}




//print(" \(userInput)")





