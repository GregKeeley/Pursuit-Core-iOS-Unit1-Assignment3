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



func filter(input: [Double], closure: Double) -> [Double] {
    var result = [Double]()
    for num in input {
        if num > closure {
            result.append(num)
        }
    }
    return result
}

func reduce(input: [Double]) -> (Double) {
    var sum = 0.0
    for num in input {
        sum += num
    }
    return sum
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

    print("type A to enter the regular calculator, or B to enter the Map, Filter, or Reduce functions: ")
    let initialUserInput = readLine()?.lowercased() ?? "a"
    
    if initialUserInput == "a" {
        print("Enter your desired function, followed by the values you would like to perform the function on and operator")
        let functionInput = readLine()?.lowercased() ?? ""
        let functionInputArray = functionInput.components(separatedBy: " ")
        let digitArray = functionInputArray[1].components(separatedBy: ",")
    if digitArray[0] == "map"  {
        let stringArr = digitArray[1].components(separatedBy: ",")
        let doubleArr = stringArr.compactMap { Double($0) } // UserInput: map 1,2,3,4,5 by * 4
        print(doubleArr)
        //let mapOpA = userArray[3]
        let mapFactor = Double(digitArray[4]) ?? 1
        var mapResult = [Double]()
        switch digitArray[3] {
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
 //       if initialUserInput[0] == "filter"
        
    }
    
print("Enter type of calculation (Ex: 3 + 5)")
    
    let userInput = readLine()?.lowercased() ?? "1 + 1"
    userArray = userInput.components(separatedBy: " ")
    
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
