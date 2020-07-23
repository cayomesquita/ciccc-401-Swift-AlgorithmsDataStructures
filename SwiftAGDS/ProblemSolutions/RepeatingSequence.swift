//
//  RepeatingSequence.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class RepeatingSequence {
    var dic = [Int:Int]()
    
    func solution(n: Int, p: Int) -> Int {
        var n = n
        var count = 0
        repeat {
            dic[n] = count
            count += 1
            n = calculate(n, p)
        } while dic[n] == nil
        return dic[n]!
    }
    
    func calculate(_ numIn : Int, _ p:Int) -> Int {
        var sum = 0
        var num = numIn
        let p = Double(p)
        repeat {
            let dig = num % 10
            sum += Int(pow(Double(dig), p))
            num = num / 10
        } while num > 0
        return sum
    }
    
    func solutionByInputFile(path: String) -> Int {
        guard let line = readFile(path)?.first else {
            return -1
        }
        let nums = line.components(separatedBy: .whitespaces).map {Int($0)!}
        return solution(n: nums.first!, p: nums.last!)
    }
}
