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
    var visited = [Bool]()
    var distance = [Int]()
    
    func solution(adjList: [[Edge]]) -> Int {
        adjacentList = adjList
        visited = [Bool](repeating: false, count: adjacentList.count)
        distance = [Int](repeating: 0, count: adjacentList.count)
        
        let queue = Queue<Int>()
        var index = 0
        queue.enqueue(item: index)
        while let u = queue.dequeue() {
            visited[u] = true
            for edge in adjList[u] {
                let v = edge.vertice
                if !visited[v] {
                    queue.enqueue(item: v)
                    distance[v] = distance[u] + edge.distance
                }
            }
        }
        for i in 0..<distance.count {
            if distance[i] > distance[index] {
                index = i
            }
        }
        visited = [Bool](repeating: false, count: adjacentList.count)
        distance = [Int](repeating: 0, count: adjacentList.count)
    
        queue.enqueue(item: index)
        while let u = queue.dequeue() {
            visited[u] = true
            for edge in adjList[u] {
                let v = edge.vertice
                if !visited[v] {
                    queue.enqueue(item: v)
                    distance[v] = distance[u] + edge.distance
                }
            }
        }
        for i in 0..<distance.count {
            if distance[i] > distance[index] {
                index = i
            }
        }
        
        return distance.max()!
    }
    
    func solutionByInputFile(path: String) -> Int{
        if let lines = readFile(path), let numVertices = Int(lines[0]) {
            adjacentList = [[Edge]](repeating: [Edge](), count: numVertices)
            for i in 1...numVertices {
                let arr = lines[i].components(separatedBy: .whitespaces).map {Int($0)!}
                var j = 0
                var element = Int(arr[j])
                let u = element - 1
                j += 1
                element = Int(arr[j])
                while element >= 0 {
                    let v = element - 1
                    j += 1
                    element = Int(arr[j])
                    let distance = element
                    let edge = Edge.init(vertice: v, distance: distance)
                    adjacentList[u].append(edge)
                    j += 1
                    element = Int(arr[j])
                }
            }
            return solution(adjList: adjacentList)
        }
        return -1
    }
    
}

struct Edge {
    let vertice: Int
    let distance: Int
}
