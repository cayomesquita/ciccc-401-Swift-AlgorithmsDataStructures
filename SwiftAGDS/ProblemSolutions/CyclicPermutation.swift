//
//  CyclicPermutation.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class CyclicPermutation {
    var adjacentList = [Int]()
       
    func solution(adjList: [Int]) -> Int {
        adjacentList = adjList
        var count = 0
        for i in 0..<adjacentList.count {
            let toVertice = adjacentList[i]
            if toVertice > 0 { // not visited
                count += findCycle(i)
            }
        }
        return count
    }
    
    func findCycle(_ verticeIndex: Int) -> Int {
        let verticeTo = adjacentList[verticeIndex]
        if verticeTo > 0 {
            adjacentList[verticeIndex] = -1
            return findCycle(verticeTo - 1)
        } else {
            return 1
        }
    }
    
    func solutionByInputFile(path: String) -> [Int] {
        guard let lines = readFile(path), let numTests = Int(lines[0]) else {
            return []
        }
        var result = [Int]()
        var numLine = 1
        for _ in 1...numTests {
            numLine += 1
            result.append(solution(adjList: lines[numLine].components(separatedBy: .whitespaces).map { Int($0)! }))
            numLine += 1
        }
        return result
    }
}
