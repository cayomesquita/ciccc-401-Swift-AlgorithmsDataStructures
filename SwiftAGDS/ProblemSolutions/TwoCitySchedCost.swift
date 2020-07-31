//
//  TwoCitySchedule.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-29.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class TwoCitySchedCost {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var diff = [Int]()
        var sum = 0
        for pair in costs {
            let a = pair[0]
            let b = pair[1]
            sum += a
            diff.append(b - a)
        }
        diff.sort()
        for numDiff in diff[0..<(diff.count / 2)] {
            sum += numDiff // already negative
        }
        return sum
    }
}
