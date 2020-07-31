//
//  GasStation.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-31.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class GasStation {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var tank = 0
        var startIndex = 0
        var total = 0
        
        for i in 0..<gas.count {
            let net = gas[i] - cost[i]
            tank += net
            total += net
            if tank < 0 {
                startIndex = i + 1
                tank = 0
            }
        }
        
        return total < 0 ? -1 : startIndex
    }
}
