//
//  Diameter.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-20.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class Diameter {
    
    var adjacentList = [[Edge]]()
    
    func solution(adjList: [[Edge]]) -> Int {
        var longestDistance = 0
        for num in 1..<adjList.count {
            if adjList[num].count == 1 {
                distanceDFS(parent: num, edge: adjList[num].first!, distanceSoFar: 0, longestDistance: &longestDistance)
            }
        }
        return longestDistance
    }
    
    func solutionByInputFile(path: String) -> Int{
        if let lines = readFile(path), let numVertices = Int(lines[0]) {
            adjacentList = [[Edge]](repeating: [Edge](), count: numVertices)
            for i in 1...numVertices {
                let arr = lines[i].components(separatedBy: .whitespaces).map {Int($0)!}
                var j = 0
                var element = Int(arr[j])
                let verticeA = element
                j += 1
                element = Int(arr[j])
                while element >= 0 {
                    let verticeB = element
                    j += 1
                    element = Int(arr[j])
                    let distance = element
                    let edge = Edge.init(vertice: verticeB, distance: distance)
                    adjacentList[verticeA - 1].append(edge)
                    j += 1
                    element = Int(arr[j])
                }
            }
            return solution(adjList: adjacentList)
        }
        return -1
    }
    
    fileprivate func distanceDFS(parent: Int, edge current: Edge, distanceSoFar: Int, longestDistance: inout Int) {
        let distance = distanceSoFar + current.distance
        let edges = adjacentList[current.vertice - 1]
        if edges.count > 1 {
            for edge in edges {
                if edge.vertice != parent {
                    distanceDFS(parent: current.vertice, edge: edge, distanceSoFar: distance, longestDistance: &longestDistance)
                }
            }
        } else {
            longestDistance = max(longestDistance, distance)
        }
    }
    
}

struct Edge {
    let vertice: Int
    let distance: Int
}
