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

//========== Repeat loop begin ====================================================
repeat {
    print("Enter type of calculation (Ex: 3 + 5)")
    
    let userInput = readLine()?.lowercased() ?? "1 + 1"
    userArray = userInput.components(separatedBy: " ")
    
    
    if userArray[0] == "map" && userArray.count == 5 {
        let stringArr = userArray[1].components(separatedBy: ",")
        let doubleArr = stringArr.compactMap { Double($0) } // UserInput: map 1,2,3,4,5 by * 4
        print(doubleArr)
        //let mapOpA = userArray[3]
        let mapFactor = Double(userArray[4]) ?? 1
        var mapResult = [Double]()
        switch userArray[3] {
        case "*":
            mapResult = myMap(num: doubleArr, closure: {$0 * mapFactor})
        case "/":
            mapResult = myMap(num: doubleArr, closure: {$0 / mapFactor})
        case "+":
            mapResult = myMap(num: doubleArr, closure: {$0 + mapFactor})
        case "-":
            mapResult = myMap(num: doubleArr, closure: {$0 - mapFactor})
        default:
            print("Does not compute")
        }
        print(mapResult)
    }
    print(userArray[0])
    print(userArray.count)
    
    
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
        var opUsed = userArray[1]
        if randomOpCheck == true {
            opUsed = "?"
        }
        print()
        print("\(op1) \(opUsed) \(op2) = \(userResult)")
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
