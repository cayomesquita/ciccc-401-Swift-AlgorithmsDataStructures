//
//  TaskSchedule.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-31.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class TaskSchedule {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var maxFreq = 0
        var maxCount = 0
        var arrFreq = [Int](repeating: 0, count: 26)
        for c in tasks {
            let num = Int(c.asciiValue!) - 65
            arrFreq[num] += 1
            if arrFreq[num] > maxFreq {
                maxFreq = arrFreq[num]
                maxCount = 1
            } else if arrFreq[num] == maxFreq {
                maxCount += 1
            }
        }
        print("maxFreq:\(maxFreq)")
        print("maxCount:\(maxCount)")
        let calc = (n + 1) * (maxFreq - 1) + maxCount
        return max(calc, tasks.count)
    }
}
