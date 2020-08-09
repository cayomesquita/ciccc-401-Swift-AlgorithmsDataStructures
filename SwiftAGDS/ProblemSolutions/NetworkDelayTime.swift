//
//  NetworkDelayTime.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-08-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class NetworkDelayTime {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
         var d = [Int](repeating: Int.max, count: N + 1)
        var visited = [Bool](repeating: false, count: N + 1)
        var adjList = [[(Int, Int)]](repeating: [(Int, Int)](), count: N + 1)
        for arr in times {
            let (u, v, time) = (arr[0], arr[1], arr[2])
            adjList[u].append((v, time))
        }
        d[K] = 0
        let queue = Queue<Int>()
        queue.enqueue(item: K)
                while let u = queue.dequeue(), !visited[u] {
            visited[u] = true
            for adj in adjList[u] {
                let (v, time) = adj
                if d[v] > d[u] + time {
                    d[v] = d[u] + time
                }
            }
            var minIndex = 0
            for i in 1..<d.count {
                if !visited[i], d[minIndex] > d[i] {
                    minIndex = i
                }
            }
            if minIndex != 0 {
                queue.enqueue(item: minIndex)
            }
        }
        d[0] = 0
        let max = d.max()!
        return max < Int.max ? max : -1

    }
}

fileprivate class Queue<E> {
    private(set) var count: Int
    fileprivate var first: Node<E>?
    fileprivate var last: Node<E>?
    
    init() {
        self.count = 0
        self.first = nil
        self.last = nil
    }
    
    public func enqueue(item: E) {
        let newNode = Node.init(item)
        if isEmpty() {
            self.first = newNode
            self.last = newNode
        } else {
            self.last!.next = newNode
            self.last = newNode
        }
        self.count += 1
    }
    
    public func dequeue() -> E? {
        if let node = self.first {
            self.first = node.next
            self.count -= 1
            return node.value
        }
        return nil
    }
    
    public func peek() -> E? {
        if let node = self.first {
            return node.value
        }
        return nil
    }
    
    public func isEmpty() -> Bool {
        return self.first == nil
    }
}

fileprivate class Node<T> {
    let value: T
    var next: Node<T>?

    init(_ value: T, _ next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

