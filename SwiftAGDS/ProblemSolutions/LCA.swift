//
//  LCA.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-20.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

func solution(edges edgesIn: [[Int]], pairs:[[Int]]) -> [Int] {
    var edgeDic = [Int:[Int]]()
    for edge in edgesIn {
        let a = edge.first!
        let b = edge.last!
        if let aux = edgeDic[a] {
            var arr = aux
            arr.append(b)
            edgeDic[a] = arr
        } else {
            edgeDic[a] = [b]
        }
        if let aux = edgeDic[b] {
            var arr = aux
            arr.append(a)
            edgeDic[b] = arr
        } else {
            edgeDic[b] = [a]
        }
    }
    var results = [Int]()
    for pair in pairs {
        if let result = lca(nil, 1, pair.first!, pair.last!, edgeDic) {
            results.append(result)
        }
    }
    return results
}

func solutionByInputFile(path: String) -> [Int] {
    if let lines = readFile(path), let numEdges = Int(lines[0]), let numLCAs = Int(lines[numEdges]) {
        var edges = [[Int]]()
        var pairs = [[Int]]()
        for i in 1..<numEdges {
            let arr = lines[i].components(separatedBy: .whitespaces)
            let a = Int(arr.first!)!
            let b = Int(arr.last!)!
            edges.append([a, b])
        }
        for i in (numEdges + 1)...(numEdges + numLCAs) {
            let arr = lines[i].components(separatedBy: .whitespaces)
            let a = Int(arr.first!)!
            let b = Int(arr.last!)!
            pairs.append([a, b])
        }
        return solution(edges: edges, pairs: pairs)
    }
    return []
}

fileprivate func lca(_ parent: Int?, _ node: Int, _ p: Int, _ q: Int, _ edges: [Int:[Int]]) -> Int? {
    if node == p || node == q {
        return node
    } else {
        guard let children = edges[node] else { return nil }
        
        var match: Int?
        for child in children {
            if child != parent {
                if let aux = lca(node, child, p, q, edges) {
                    if match == nil {
                        match = aux
                    } else {
                        return node
                    }
                }
            }
        }
        return match
    }
}
