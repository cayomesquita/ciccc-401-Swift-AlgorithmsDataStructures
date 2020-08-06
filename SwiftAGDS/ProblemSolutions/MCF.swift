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
        var unionFind = UnionFind(n + 1)
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
//        print("PlanCost: \(planCost) - Cost: \(cost) = \(planCost - cost)")
        return cost < planCost ? days : 0
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

func runInput() {
    if let header = readLine()?.components(separatedBy: .whitespaces).map({ Int($0)! }) {
        let n = header[0]
        let m = header[1]
        let d = header[2]
        var arr = [[Int]]()
        for i in 1...m {
            if var nums = readLine()?.components(separatedBy: .whitespaces).map({ Int($0)! }) {
                nums.append(i < n ? 1 : 0)
                arr.append(nums)
            }
        }
        
        print(MCF().solution(arr, n, m, d))
    }
    
}

fileprivate struct UnionFind {
    /// parent[i] = parent of i
    private var parent: [Int]
    /// size[i] = number of nodes in tree rooted at i
    private var size: [Int]
    /// number of components
    private(set) var count: Int
    
    /// Initializes an empty union-find data structure with **n** elements
    /// **0** through **n-1**.
    /// Initially, each elements is in its own set.
    /// - Parameter n: the number of elements
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](repeating: 1, count: n)
        self.parent = [Int](repeating: 0, count: n)
        for i in 0..<n {
            self.parent[i] = i
        }
    }
    
    /// Returns the canonical element(root) of the set containing element `p`.
    /// - Parameter p: an element
    /// - Returns: the canonical element of the set containing `p`
    public mutating func find(_ p: Int) -> Int {
        var canonicalElement = p
        repeat {
            canonicalElement = parent[canonicalElement]
        } while canonicalElement != parent[canonicalElement]
        parent[p] = canonicalElement
        return canonicalElement
    }
    
    /// Returns `true` if the two elements are in the same set.
    /// - Parameters:
    ///   - p: one elememt
    ///   - q: the other element
    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    /// Merges the set containing element `p` with the set containing
    /// element `q`
    /// - Parameters:
    ///   - p: one element
    ///   - q: the other element
    public mutating func union(_ p: Int, _ q: Int) {
        let rootP = find(p)
        let rootQ = find(q)
        let weightP = size[rootP]
        let weightQ = size[rootQ]
        if weightP > weightQ {
            parent[rootQ] = rootP
            size[rootP] = weightP + weightQ
        } else {
            parent[rootP] = rootQ
            size[rootQ] = weightP + weightQ
        }
    }
    
}

