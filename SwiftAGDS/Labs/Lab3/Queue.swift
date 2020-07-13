//
//  Queue.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-13.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

public final class Queue<E> {
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

extension Queue : Sequence {
    public typealias Element = E

    public typealias Iterator = QueueIterator

    public class QueueIterator : IteratorProtocol{
        fileprivate var currentNode: Node<E>?

        public typealias Element = E

        fileprivate init(_ node: Node<E>?) {
            self.currentNode = node
        }
        public func next() -> E? {
            if let node = self.currentNode {
                self.currentNode = node.next
                return node.value
            }
            return nil
        }
    }

    public func makeIterator() -> Iterator {
        return QueueIterator(first)
    }
}
