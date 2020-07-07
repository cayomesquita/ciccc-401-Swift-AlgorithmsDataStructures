//
//  QuickSort.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-06.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

func quickSort<T: Comparable>(_ arr: [T]) -> [T] {
    var list = arr
    quickSort(&list, 0, list.count - 1)
    return list
}

func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
    if end > start {
        let pivot = partition(&arr, start, end)
        quickSort(&arr, start, pivot - 1)
        quickSort(&arr, pivot + 1, end)
    }
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ startInput: Int, _ endInput: Int) -> Int {
    var start = startInput
    var end = endInput
    var pivot = end
    while start < end {
        if pivot == end {
            if arr[start] > arr[pivot] {
                arr.swapAt(start, pivot)
                pivot = start
                end -= 1
            } else {
                start += 1
            }
        } else {
            if arr[end] > arr[pivot] {
                end -= 1
            } else {
                arr.swapAt(end, pivot)
                pivot = end
                start += 1
            }
        }
    }
    
  return pivot
}
