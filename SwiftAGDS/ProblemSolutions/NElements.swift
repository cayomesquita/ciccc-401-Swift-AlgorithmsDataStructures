//
//  SmallestNElements.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

func larggest(_ limitSize: Int, of list:[Int]) -> [Int] {
    let heap = HeapSort()
    for num in list {
        heap.push(num)
        if heap.count > limitSize {
            heap.pop()
        }
    }
    var result: [Int] = []
    while let num = heap.pop() {
        result.append(num)
    }
    return result
}

fileprivate class HeapSort {
    var arr: [Int]
    var count: Int
    
    init() {
        self.arr = []
        self.count = 0
    }
    
    func push(_ num : Int) {
        arr.append(num)
        heapfyUp(count)
        count += 1
    }
    
    func pop() -> Int? {
        if count > 0 {
            count -= 1
            arr.swapAt(0, count)
            let result = arr.remove(at: count)
            heapfy(0)
            return result
        }
        return nil
    }
    
    func heapfyUp(_ index: Int) {
        let parent = (index - 1) / 2
        if index > 0, arr[parent] >= arr[index] {
            arr.swapAt(parent, index)
            heapfyUp(parent)
        }
    }
    
    func heapfy(_ parent: Int) {
        let left = (parent * 2) + 1
        let right = (parent * 2) + 2
        if right < count {
            if arr[left] < arr[right] {
                if arr[left] < arr[parent] {
                    arr.swapAt(left, parent)
                    heapfy(left)
                }
            } else {
                if arr[right] < arr[parent] {
                    arr.swapAt(right, parent)
                    heapfy(right)
                }
            }
        } else if left < count, arr[left] < arr[parent] {
            arr.swapAt(left, parent)
            heapfy(left)
        }
    }
}
