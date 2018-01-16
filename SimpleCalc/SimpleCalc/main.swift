//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let size = args.count
        let result: Int
        if size == 1 {
            return 0
        }
        if args.contains("count"){
            return size - 1
        } else if args.contains("avg") {
            var total = 0
            for number in args {
                if isStringAnInt(string: number) {
                    total += Int(number) ?? 0
                }
            }
            result = total / (size - 1)
        } else if args.contains("fact") {
            let factNumber = Int(args[0]) ?? 0
            result = factorial(facNumber: factNumber)
        } else {
            result = simpleFunc(args)
        }
        
        
        return result
    }
    
    private func factorial(facNumber: Int) -> Int {
        if facNumber == 0 {
            return 1
        } else {
            return facNumber * factorial(facNumber: facNumber - 1)
        }
    }
    
    private func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }

    
    private func simpleFunc(_ args: [String]) -> Int {
        var result: Int?
        let number1 = Int(args[0]) ?? 0
        let number2 = Int(args[2]) ?? 0
        switch args[1] {
        case "+":
            result = number1 + number2
        case "-":
            result = number1 - number2
        case "*":
            result = number1 * number2
        case "/":
            result = number1 / number2
        case "%":
            if (number1 > 0 && number2 < 0) || (number1 < 0 && number2 < 0) {
                result = (number1 % number2) * -1
            } else {
                result = number1 % number2
            }
            
        default:
            result = 0
        }
        if let number = result {
            return number
        } else {
            return 0
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))
//print(Calculator().calculate(first))

