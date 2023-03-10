//
//  main.swift
//  0706012110018-Vebrillia Santoso-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var userInput: String = ""
var cafetaria = ["Tuku-Tuku", "Gotri", "Madam Liy", "Kopte", "Xiang Jia"]
var tukuTukuMenu = ["Tahu isi", "Nasi Kuning", "Nasi Campur", "Air Mineral"]
var tukuTukuHarga = [15000, 20000, 25000, 5000]
var gotriMenu = ["Nasi Goreng" , "Mie Goreng", "Kwetiaw", "Es Jeruk", "Es Teh"]
var gotriHarga = [28000, 25000, 25000, 8000, 5000]
var madamLiyMenu = ["Ayam Geprek", "Ayam Goreng", "Nasi Goreng", "Es Milo", "Es Teh"]
var madamLiyHarga = [28000, 25000, 30000, 10000, 5000]
var kopteMenu = ["Americano", "Kopi Susu", "Machiato", "Moccachino", "Black Kawa Tea"]
var kopteHarga = [30000, 20000, 25000, 28000, 25000]
var xiangJiaMenu = ["Mie Hiwan", "Mie Polos", "Kaya Toast", "Mie Ayam Kobe", "Teh Tarik", "Kopi susu"]
var xiangJiaHarga = [30000, 20000, 15000, 30000, 15000, 20000]
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
        gotri()
        break
    case "3" :
        madamLiy()
        break
    case "4" :
        kopte()
        break
    case "5" :
        xiangJia()
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
        } else if amount == nil{
            print("Please enter your payment.")
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
              How many \(tukuTukuMenu[0]) do you want to buy?
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
              How many  \(tukuTukuMenu[1]) do you want to buy?
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
              How many  \(tukuTukuMenu[2]) do you want to buy?
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
              How many \(tukuTukuMenu[3]) do you want to buy?
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

func gotri(){
    print("""
          
          Hi, Welcome back to Gotri!
          What would you like to order?
          
          """)
    
    for(index, menu) in gotriMenu.enumerated(){
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
              
              \(gotriMenu[0]) @ \(gotriHarga[0].formatted())
              How many \(gotriMenu[0]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = gotriHarga[0] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(gotriMenu[0]) @ \(harga.formatted())")
        cartFrom.append("Gotri")
        cartTotal += harga
        
        gotri()
        
    case "2" :
        print("""
              
              \(gotriMenu[1]) @ \(gotriHarga[1].formatted())
              How many \(gotriMenu[1]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = gotriHarga[1] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(gotriMenu[1]) @ \(harga.formatted())")
        cartFrom.append("Gotri")
        cartTotal += harga
        
        gotri()
        
    case "3" :
        print("""
              
              \(gotriMenu[2]) @ \(gotriHarga[2].formatted())
              How many \(gotriMenu[2]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = gotriHarga[2] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(gotriMenu[2]) @ \(harga.formatted())")
        cartFrom.append("Gotri")
        cartTotal += harga
        
        gotri()
        
    case "4" :
        print("""
              
              \(gotriMenu[3]) @ \(gotriHarga[3].formatted())
              How many \(gotriMenu[3]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = gotriHarga[3] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(gotriMenu[3]) @ \(harga.formatted())")
        
        cartFrom.append("Gotri")
        cartTotal += harga
        
        gotri()
        
    case "b" :
        welcomeScreen()
    default:
        gotri()
    }
}

func madamLiy (){
    print("""
          
          Hi, Welcome back to Madam Liy!
          What would you like to order?
          
          """)
    
    for(index, menu) in madamLiyMenu.enumerated(){
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
              
              \(madamLiyMenu[0]) @ \(madamLiyHarga[0].formatted())
              How many \(madamLiyMenu[0]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = madamLiyHarga[0] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(madamLiyMenu[0]) @ \(harga.formatted())")
        cartFrom.append("Madam Liy")
        cartTotal += harga
        
        madamLiy()
        
    case "2" :
        print("""
              
              \(madamLiyMenu[1]) @ \(madamLiyHarga[1].formatted())
              How many \(madamLiyMenu[1]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = madamLiyHarga[1] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(madamLiyMenu[1]) @ \(harga.formatted())")
        cartFrom.append("Madam Liy")
        cartTotal += harga
        
        madamLiy()
        
    case "3" :
        print("""
              
              \(madamLiyMenu[2]) @ \(madamLiyHarga[2].formatted())
              How many \(madamLiyMenu[2]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = madamLiyHarga[2] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(madamLiyMenu[2]) @ \(harga.formatted())")
        cartFrom.append("Madam Liy")
        cartTotal += harga
        
        madamLiy()
        
    case "4" :
        print("""
              
              \(madamLiyMenu[3]) @ \(madamLiyHarga[3].formatted())
              How many \(madamLiyMenu[3]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = madamLiyHarga[3] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(madamLiyMenu[3]) @ \(harga.formatted())")
        
        cartFrom.append("Madam Liy")
        cartTotal += harga
        
        madamLiy()
        
    case "b" :
        welcomeScreen()
    default:
        madamLiy()
    }
}

func kopte (){
    print("""
          
          Hi, Welcome back to Kopte!
          What would you like to order?
          
          """)
    
    for(index, menu) in kopteMenu.enumerated(){
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
              
              \(kopteMenu[0]) @ \(kopteHarga[0].formatted())
              How many \(kopteMenu[0]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = kopteHarga[0] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(kopteMenu[0]) @ \(harga.formatted())")
        cartFrom.append("Kopte")
        cartTotal += harga
        
        kopte()
        
    case "2" :
        print("""
              
              \(kopteMenu[1]) @ \(kopteHarga[1].formatted())
              How many \(kopteMenu[1]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = kopteHarga[1] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(kopteMenu[1]) @ \(harga.formatted())")
        cartFrom.append("Kopte")
        cartTotal += harga
        
        kopte()
        
    case "3" :
        print("""
              
              \(kopteMenu[2]) @ \(kopteHarga[2].formatted())
              How many \(kopteMenu[2]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = kopteHarga[2] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(kopteMenu[2]) @ \(harga.formatted())")
        cartFrom.append("Kopte")
        cartTotal += harga
        
        kopte()
        
    case "4" :
        print("""
              
              \(kopteMenu[3]) @ \(kopteHarga[3].formatted())
              How many \(kopteMenu[3]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = kopteHarga[3] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(kopteMenu[3]) @ \(harga.formatted())")
        
        cartFrom.append("Kopte")
        cartTotal += harga
        
        kopte()
        
    case "b" :
        welcomeScreen()
    default:
        kopte()
    }
}

func xiangJia (){
    print("""
          
          Hi, Welcome back to Xiang Jia!
          What would you like to order?
          
          """)
    
    for(index, menu) in xiangJiaMenu.enumerated(){
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
              
              \(xiangJiaMenu[0]) @ \(xiangJiaHarga[0].formatted())
              How many \(xiangJiaMenu[0]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = xiangJiaHarga[0] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(xiangJiaMenu[0]) @ \(harga.formatted())")
        cartFrom.append("Xiang Jia")
        cartTotal += harga
        
        xiangJia()
        
    case "2" :
        print("""
              
              \(xiangJiaMenu[1]) @ \(xiangJiaHarga[1].formatted())
              How many \(xiangJiaMenu[1]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = xiangJiaHarga[1] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(xiangJiaMenu[1]) @ \(harga.formatted())")
        cartFrom.append("Xiang Jia")
        cartTotal += harga
        
        xiangJia()
        
    case "3" :
        print("""
              
              \(xiangJiaMenu[2]) @ \(xiangJiaHarga[2].formatted())
              How many \(xiangJiaMenu[2]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = xiangJiaHarga[2] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(xiangJiaMenu[2]) @ \(harga.formatted())")
        cartFrom.append("Xiang Jia")
        cartTotal += harga
        
        xiangJia()
        
    case "4" :
        print("""
              
              \(xiangJiaMenu[3]) @ \(xiangJiaHarga[3].formatted())
              How many \(xiangJiaMenu[3]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = xiangJiaHarga[3] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(xiangJiaMenu[3]) @ \(harga.formatted())")
        
        cartFrom.append("Xiang Jia")
        cartTotal += harga
        
        xiangJia()
        
    case "5" :
        print("""
              
              \(xiangJiaMenu[4]) @ \(xiangJiaHarga[4].formatted())
              How many \(xiangJiaMenu[4]) do you want to buy?
              """, terminator: " ")
        
        userInput = readLine()!
        
        print("Thank you for ordering.")
        
        let harga = xiangJiaHarga[4] * (Int(userInput) ?? 0)
        
        shoppingCart.append("\(userInput)x \(xiangJiaMenu[4]) @ \(harga.formatted())")
        
        cartFrom.append("Xiang Jia")
        cartTotal += harga
        
        xiangJia()
        
    case "b" :
        welcomeScreen()
    default:
        xiangJia()
    }
}


