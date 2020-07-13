//
//  main.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

print("Stack")

var stack = Stack<Int>()
stack.push(item: 1)
stack.push(item: 2)
stack.push(item: 3)

for num in stack {
    print(num)
}

print("Queue")

var queue = Queue<Int>()
queue.enqueue(item: 1)
queue.enqueue(item: 2)
queue.enqueue(item: 3)

for num in queue {
    print(num)
}





