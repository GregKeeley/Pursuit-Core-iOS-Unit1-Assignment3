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
