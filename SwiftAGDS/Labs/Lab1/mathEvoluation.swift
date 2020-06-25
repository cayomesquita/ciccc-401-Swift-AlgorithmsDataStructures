//
//  mathEvoluation.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-24.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

//
// Python Algorithms - Lecture 15 recursion
//
//def evaluate_helper(expr: str, i: int):
//    if expr[i].isdigit():
//        return int(expr[i]), i
//    else:
//        i += 1
//        left, i = evaluate_helper(expr, i)
//        i += 1
//        op = expr[i]
//        i += 1
//        right, i = evaluate_helper(expr, i)
//        i += 1
//        if op == "+":
//            return left + right, i
//        else:
//            return left * right, i
//def evaluate(expr: str):
//    res = evaluate_helper(expr, 0)
//    return res[0]
//

func evoluate(expression:String) -> Int {
    let result:(expr:String, value:Int) = evoluate_helper(expression: expression, index: 0)
    return Int(result.expr)!
}

func evoluate_helper(expression:String, index indexInt:Int) -> (String, Int) {
    var index = indexInt
    let char = String(expression[expression.index(expression.startIndex, offsetBy: index)])
    if let _ = Int(char) {
        return (char, index)
    } else {
        index += 1
        let term1:(String, Int) = evoluate_helper(expression: expression, index: index)
        let operand1 = Int(term1.0)!
        index = term1.1 + 1
        let op = String(expression[expression.index(expression.startIndex, offsetBy: index)])
        index += 1
        let term2:(String, Int) = evoluate_helper(expression: expression, index: index)
        let operand2 = Int(term2.0)!
        index = term2.1 + 1
        if op == "+" {
            return (String(operand1 + operand2), index)
        } else {
            return (String(operand1 * operand2), index)
        }

    }
    
}
