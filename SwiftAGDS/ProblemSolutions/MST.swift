//
//  MST.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/30/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// Minimum Spanning Tree Algorithms
public final class MST {
  
    /// Prim's MST Algorithm O(ElgV)
    /// Use Priority Queue (Binary Heap) and Adjacency List
    /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
    /// - Returns: the minimum cost spanning tree
    public func primMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
        var graph = graph
        var visited = [Bool](repeating: false, count: graph.count)
        var sum = 0
        for u in 0..<visited.count {
            if !visited[u] {
                dfsPrimMST(u, &graph, &visited, &sum)
            }
        }
        return sum
    }
    
    fileprivate func dfsPrimMST(_ u: Int, _ graph: inout [[(v: Int, w: Int)]], _ visited: inout [Bool], _ sum: inout Int) {
        visited[u] = true
        let edges = BH(graph[u].map {Tuple.init(v: $0.v, w: $0.w)})
        while let edge = edges.pop() {
            if !visited[edge.v] {
                sum += edge.w
                dfsPrimMST(edge.v, &graph, &visited, &sum)
            }
        }
    }

    /// Kruskal's MST Algorithm O(ElgE)
    /// Use Union-Find and Adjacency List (You can use Swift's built-in sort method.)
    /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
    /// - Returns: the minimum cost spanning tree
    public func kruskalMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
        return -1
    }
    
}

struct Tuple {
    let v: Int
    let w: Int
}

extension Tuple : Comparable {
    static func < (lhs: Tuple, rhs: Tuple) -> Bool {
        return lhs.w < rhs.w
    }
}

