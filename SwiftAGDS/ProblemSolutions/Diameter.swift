//
//  Diameter.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-20.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class Diameter {
    
    func solution(edgesDic: [Int:[Edge]]) -> Int {
        var longestDistance = 0
        for entry in edgesDic {
            if entry.value.count == 1 {
                distanceDFS(parent: entry.key, edge: entry.value.first!, edgesDic: edgesDic, distanceSoFar: 0, longestDistance: &longestDistance)
            }
        }
        return longestDistance
    }
    
    func solutionByInputFile(path: String) -> Int{
        if let lines = readFile(path), let numVertices = Int(lines[0]) {
            var edgeDic = [Int:[Edge]]()
            for i in 1...numVertices {
                let arr = lines[i].components(separatedBy: .whitespaces)
                var j = 0
                var element = Int(arr[j])!
                let verticeA = element
                j += 1
                element = Int(arr[j])!
                while element >= 0 {
                    let verticeB = element
                    j += 1
                    element = Int(arr[j])!
                    let distance = element
                    let edge = Edge.init(vertice: verticeB, distance: distance)
                    if let aux = edgeDic[verticeA] {
                        var arr = aux
                        arr.append(edge)
                        edgeDic[verticeA] = arr
                    } else {
                        edgeDic[verticeA] = [edge]
                    }
                    
                    j += 1
                    element = Int(arr[j])!
                }
            }
            return solution(edgesDic: edgeDic)
        }
        return -1
    }
    
    fileprivate func distanceDFS(parent: Int, edge current: Edge, edgesDic: [Int:[Edge]], distanceSoFar: Int, longestDistance: inout Int) {
        let distance = distanceSoFar + current.distance
        if let edges = edgesDic[current.vertice], edges.count > 1 {
            for edge in edges {
                if edge.vertice != parent {
                    distanceDFS(parent: current.vertice, edge: edge, edgesDic: edgesDic, distanceSoFar: distance, longestDistance: &longestDistance)
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
