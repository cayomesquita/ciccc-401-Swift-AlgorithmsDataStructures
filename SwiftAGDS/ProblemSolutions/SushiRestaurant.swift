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
    var visited = [Bool]()
    var distance = Int.max
    var numVertices = 0
    
    func solution(_ adjList: [[Int]], _ targetsIn: [Int]) -> Int {
        print("size: \(adjList.count)")
        adjacentList = adjList
        numVertices = adjacentList.count
        targets = targetsIn
        cutLeaf(vertice: targets.first!)
        let edges = adjacentList.map {$0.map {Edge(vertice: $0, distance: 1)}}
        let diameter = Diameter.init().solution(adjList: edges)
        return (numVertices - 1) * 2 - diameter
    }
    
    func solutionByInputFile(inFile: String, outFile: String? = nil) -> Int {
        guard let lines = readFile(inFile) else {
            return -1
        }
        let header = lines[0].components(separatedBy: .whitespaces).map {Int($0)!}
        let numRestaurant = header.first!
        let numRealSushi = header.last!
        adjacentList = [[Int]](repeating: [Int](), count: numRestaurant)
        visited = [Bool](repeating: false, count: numRestaurant)
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
                print("Success")
            } else {
                print("Fail (expected:\(answer) - result:\(result))")
            }
        }
        return result
    }
    
    func cutLeaf(vertice u: Int) -> Bool {
        visited[u] = true
        let edges = adjacentList[u]
        if edges.count == 1, visited[edges.first!] {
            return !targets.contains(u)
        } else {
            var found = targets.contains(u)
            for v in edges {
                if !visited[v] {
                    if cutLeaf(vertice: v) {
                        adjacentList[u].remove(at: adjacentList[u].firstIndex(of: v)!)
                        adjacentList[v].remove(at: adjacentList[v].firstIndex(of: u)!)
                        numVertices -= 1
                    } else {
                        found = true
                    }
                }
            }
            return !found
        }
    }
}
