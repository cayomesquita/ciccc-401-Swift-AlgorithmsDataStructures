//
//  Stack.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-13.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

public final class Stack<E> : Sequence{
    private(set) var count: Int
    var root: Node<E>?
    
    init() {
        self.count = 0
        self.root = nil
    }
    
    public func push(item: E) {
        if isEmpty() {
            self.root = Node.init(item)
        } else {
            self.root = Node.init(item, self.root!)
        }
        self.count += 1
    }
    
    public func pop() -> E? {
        if let node = self.root {
            self.root = node.next
            self.count -= 1
            return node.value
        }
        return nil
    }
    
    public func peek() -> E? {
        if let node = self.root {
            return node.value
        }
        return nil
    }
    
    public func isEmpty() -> Bool {
        return self.root == nil
    }
    
    public class StackIterator : IteratorProtocol{
        var currentNode: Node<E>?
        
        public typealias Element = E
        
        init(_ node: Node<E>?) {
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
    
    public func makeIterator() -> StackIterator {
        return StackIterator(root)
    }
}
