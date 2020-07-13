//
//  Node.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-13.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

public final class Node<T> {
    let value: T
    var next: Node?
    
    init(_ value: T, _ next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}
