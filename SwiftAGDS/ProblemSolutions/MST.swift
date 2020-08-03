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
        
        var u = 0
        visited[u] = true
        var edges = BH<Tuple>(graph[u].map {Tuple.init(u: u, v: $0.v, w: $0.w)})
        while let edge = edges.pop() {
            let v = edge.v
            let weight = edge.w
            if !visited[v] {
                visited[v] = true
                sum += weight
                for tuple in graph[v].map {Tuple.init(u: v, v: $0.v, w: $0.w)} {
                    if !visited[tuple.v] {
                        edges.push(tuple)
                    }
                }
            }
        }
        return sum
    }
    
//    fileprivate func dfsPrimMST(_ u: Int, _ graph: inout [[(v: Int, w: Int)]], _ visited: inout [Bool], _ edges: BH<Tuple>, _ sum: inout Int) {
//        visited[u] = true
//        for tuple in graph[u].map {Tuple.init(u: u, v: $0.v, w: $0.w)} {
//            edges.push(tuple)
//        }
//        while let edge = edges.pop() {
//            if !visited[edge.v] {
//                sum += edge.w
//                dfsPrimMST(edge.v, &graph, &visited, &sum)
//            }
//        }
//    }

    /// Kruskal's MST Algorithm O(ElgE)
    /// Use Union-Find and Adjacency List (You can use Swift's built-in sort method.)
    /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
    /// - Returns: the minimum cost spanning tree
    public func kruskalMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
        var edges = [Tuple]()
        for u in 0..<graph.count {
            for edge in graph[u] {
                edges.append(Tuple(u: u, v: edge.v, w: edge.w))
            }
        }
        edges.sort()
        var uf = UF(graph.count)
        var sum = 0
        for edge in edges {
            let u = edge.u
            let v = edge.v
            let weight = edge.w
            if !uf.connected(u, v) {
                uf.union(u, v)
                sum += weight
            }
        }
        return sum
    }
    
}

fileprivate struct Tuple {
    let u: Int
    let v: Int
    let w: Int
}

extension Tuple : Comparable {
    static func < (lhs: Tuple, rhs: Tuple) -> Bool {
        return lhs.w < rhs.w
    }
}

