//
//  MCF.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-08-04.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class MCF {
    
//    private var pipesBH = BH<Tuple>()
    private var adjList = [Tuple]()
    private var d = 0
    
    func solution(_ pipes: [[Int]], _ n: Int, _ m: Int, _ d: Int) -> Int {
        self.d = d
        var unionFind = UF(n + 1)
        var planCost = 0
        var cost = 0
        for nums in pipes {
            let u = nums[0]
            let v = nums[1]
            let cost = nums[2]
            let actived = nums[3] > 0
            if actived {
                planCost += cost
            }
//            self.pipesBH.push(Tuple(u: u, v: v, cost: cost, actived: actived))
            self.adjList.append(Tuple(u: u, v: v, cost: cost, actived: actived))
        }
        self.adjList.sort()
        let limitPipes = n - 1
        var numPipes = 0
        var days = 0
        
        while numPipes < limitPipes {
            let pipe = self.adjList.removeFirst()
            if !unionFind.connected(pipe.u, pipe.v) {
//            if let pipe = self.pipesBH.pop(), !unionFind.connected(pipe.u, pipe.v) {
                let u = pipe.u
                let v = pipe.v
                unionFind.union(u, v)
                numPipes += 1
                cost += numPipes < limitPipes ? pipe.cost : max(0, pipe.cost - d)
                if !pipe.actived {
                    days += 1
                }
            }
        }
        print("PlanCost: \(planCost) - Cost: \(cost) = \(planCost - cost)")
        return cost < planCost ? days : 0
     }
        
    func solutionByInputFile(inFile: String, outFile: String? = nil) -> Int {
        guard let lines = readFile(inFile) else {
            return -1
        }
        let header = lines[0].components(separatedBy: .whitespaces).map { Int($0)! }
        let n = header[0]
        let m = header[1]
        let d = header[2]
        var arr = [[Int]]()
        for i in 1...m {
            var nums = lines[i].components(separatedBy: .whitespaces).map {Int($0)!}
            nums.append(i < n ? 1 : 0)
            arr.append(nums)
        }

        let result = solution(arr, n, m, d)

        if let outFile = outFile, let line = readFile(outFile)?.first, let answer = Int(line) {
            if result == answer {
                print("Success")
            } else {
                print("Fail (expected:\(answer) - result:\(result))")
            }
        }
        return result
    }
}

fileprivate struct Tuple {
    let u: Int
    let v: Int
    var cost: Int
    var actived: Bool
}

extension Tuple: Comparable {
    static func < (lhs: Tuple, rhs: Tuple) -> Bool {
        return lhs.cost < rhs.cost
    }
}
