//
//  Recursion.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

func power(base: Int, powerTo: Int) -> Int {
    if powerTo == 0 {
        return 1
    }
    return base * power(base: base, powerTo: powerTo - 1)
}

//func isPalindrome(word:String) -> Bool {
//    if word.count <= 1 {
//        true
//    }
//    if word.first! == word.last! {
//        return isPalindrome(word: word.substring(with: NSMakeRange(1, word.count - 1)))
//    } else {
//        return false
//    }
//}

func printBinary(num: Int) -> Void {
    if num > 1 {
        let binary = num % 2
        let newNum = num / 2
        printBinary(num: newNum)
        print(binary , terminator: "")
    } else {
        print(num , terminator: "")
    }
}
