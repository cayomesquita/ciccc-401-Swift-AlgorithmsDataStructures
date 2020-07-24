//
//  SushiRestaurant.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-24.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class SushiRestaurant {
    
    var adjacentList = [[Int]]()
    var targets = [Int]()
    var visisted = [Bool]()
    
    func solution(_ adjList: [[Int]], _ targetsIn: [Int]) -> Int {
        adjacentList = adjList
        targets = targetsIn
        cutLeaf(vertice: targets.first!)
        return -1
    }
    
    func solutionByInputFile(inFile: String, outFile: String? = nil) -> Int {
        guard let lines = readFile(inFile) else {
            return -1
        }
        let header = lines[0].components(separatedBy: .whitespaces).map {Int($0)!}
        let numRestaurant = header.first!
        let numRealSushi = header.last!
        adjacentList = [[Int]](repeating: [Int](), count: numRestaurant)
        visisted = [Bool](repeating: false, count: numRestaurant)
        targets = lines[1].components(separatedBy: .whitespaces).map {Int($0)!}
        for i in 2...numRestaurant {
            let line = lines[i].components(separatedBy: .whitespaces).map {Int($0)!}
            let u = line.first!
            let v = line.last!
            adjacentList[u].append(v)
            adjacentList[v].append(u)
        }
        
        let result = solution(adjacentList, targets)
        
        if let outFile = outFile, let line = readFile(outFile)?.first, let answer = Int(line) {
            if result == answer {
                print("Sucess")
            } else {
                print("Fail")
            }
        }
        return result
    }
    
    func cutLeaf(vertice u: Int) -> Bool {
        visisted[u] = true
        let edges = adjacentList[u]
        if edges.count == 1, visisted[edges.first!] {
            return !targets.contains(u)
        } else {
            var found = false
            for v in edges {
                if !visisted[v] {
                    if cutLeaf(vertice: v) {
                        adjacentList[u].remove(at: adjacentList[u].firstIndex(of: v)!)
                        adjacentList[v].remove(at: adjacentList[v].firstIndex(of: u)!)
                    } else {
                        found = true
                    }
                }
            }
            return !found
        }
    }
}
