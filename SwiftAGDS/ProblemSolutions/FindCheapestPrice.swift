//
//  FindCheapestPrice.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-08-10.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class FindCheapestPrice {
    
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var d = [[Int]](repeating: [Int](repeating: Int.max, count: K + 2), count: n + 1)
        var adjList = [[(Int, Int)]](repeating: [(Int, Int)](), count: n)
        for arr in flights {
            let (u, v, price) = (arr[0], arr[1], arr[2])
            adjList[u].append((v, price))
        }
        d[src] = [Int](repeating: 0, count: K + 2)
        let queue = Queue<(Int, Int)>()
        queue.enqueue(item: (src, 0))
        while let tuple = queue.dequeue() {
            let (u, stepsU) = tuple
            let steps = stepsU + 1
            for adj in adjList[u] {
                let (v, price) = adj
                if d[v][steps] > d[u][stepsU] + price {
                    d[v][steps] = d[u][stepsU] + price
                }
                if dst != v, steps < K+1 {
                    queue.enqueue(item: (v, steps))
                }
            }
        }
        if let cost = d[dst].min(), cost < Int.max {
            return cost
        } else {
            return -1
        }
    }
}
