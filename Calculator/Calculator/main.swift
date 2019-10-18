//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double { // mathInput, closure, return
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}

let additionOpertation = mathStuffFactory(opString: "+")
let multiplecationOp = mathStuffFactory(opString: "*")
let divisionOp = mathStuffFactory(opString: "/")
let subtractionOp = mathStuffFactory(opString: "-")

//=================================================================================
// Custom functions
//=================================================================================

// custom Map
func myMap(num: [Double], closure: (Double) -> Double) -> [Double] {
    var numArr = [Double]()
    for num in numArr {
        numArr.append(closure(num))
    }
    return numArr
}



func filter () -> () {
    
}

func reduce() -> () {
    
}


//=================================================================================
// Repeat loop setup and var/lets
//=================================================================================
var repeatCondition = true // Repeat condition
var userArray = [String]()
let randomOperation = ["+", "-", "/", "*"]
var randomOpUsed = String()
var randomOpCheck = false

repeat {
    print("Enter type of calculation (Ex: 3 + 5)")
    
    let userInput = readLine()?.lowercased() ?? "1 + 1" // Taking user input
    userArray = userInput.components(separatedBy: " ") // Separating into different array indices
    
//    switch userArray[0] {
////    case filter:
////        break
//    case map:
//        var mapArr = userArray[1].components(separatedBy: ",")
//        print("Map has been activated")
////    case reduce:
////        break
//    default:
//        break
//    }
    if userArray[0] == "map" {
       // var mapDoubles = userArray[1].components(separatedBy: ",")
        var newMapDoubles = [Double]()
        for num in userArray[1] {
            if num.isNumber {
                newMapDoubles.append(Double(Character(num)))
    }
    
    
    if userArray.count == 3 && userArray[1] == "?" {
        print("This used a random operator")
        userArray[1] = randomOperation.randomElement() ?? "+"
        randomOpUsed = userArray[1]
        randomOpCheck = true
    }
    if userArray.count == 3 {
        let op1 = Double(userArray[0]) ?? 0.0
        let op2 = Double(userArray[2]) ?? 0.0
        let closureOp = mathStuffFactory(opString: userArray[1])
        let userResult = closureOp(op1,op2)
        print(userResult)
    } else {
        print("Try again")
    }
    if randomOpCheck == true {
        print("Can you guess random operator just used? Choices: *, +, -, /")
        let userGuess = readLine()
        if userGuess == randomOpUsed {
            print("Correct!")
        } else {
            print("Nope.")
        }
    }
    print()
    print("Would you like to continue calculating?")
    let contPrompt = readLine()?.lowercased() ?? "no"
    if contPrompt == "yes" {
        continue
        
    } else {
        repeatCondition = false
    }
}
    while repeatCondition
