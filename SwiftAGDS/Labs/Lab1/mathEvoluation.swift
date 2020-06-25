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
    var index = 0
    return evoluate_helper(expression: expression, index: &index)
}

func evoluate_helper(expression:String, index: inout Int) -> Int {
    let char = String(expression[expression.index(expression.startIndex, offsetBy: index)])
    if let num = Int(char) {
        return num
    } else {
        index += 1
        let operand1 = evoluate_helper(expression: expression, index: &index)
        index += 1
        let op = String(expression[expression.index(expression.startIndex, offsetBy: index)])
        index += 1
        let operand2 = evoluate_helper(expression: expression, index: &index)
        index += 1
        if op == "+" {
            return operand1 + operand2
        } else {
            return operand1 * operand2
        }
    }
}
