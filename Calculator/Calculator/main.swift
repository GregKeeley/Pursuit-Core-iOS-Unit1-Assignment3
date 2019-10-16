//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
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


let result = additionOpertation(45, 5)
let resultMutliple = multiplecationOp(5, 5)
let resultDivision = divisionOp(100, 10)
let resultSubtraction = subtractionOp(500, 400)

print("Result of addition operation is \(result)")
print("Result of subtraction operation is \(resultSubtraction)")
print("Result of division operation is \(resultDivision)")
print("Result of multplication operation is \(resultMutliple)")

var repeatCondition = true // Repeat condition
var userArray = [String]()
var randomOperation = ["+", "-", "/", "*"]
var randomOpUsed = String()
var randomOpCheck = false

repeat {
    print("Enter type of calculation (Ex: 3 + 5)")
    
    let userInput = readLine() ?? "1 + 1" // Taking user input
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
        print("Would you like to continue calculating?")
        let contPrompt = readLine()?.lowercased() ?? "no"
        if contPrompt == "yes" {
            continue
        } else {
            repeatCondition = false
        }
    }
    while repeatCondition
