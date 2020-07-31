//
//  PartitionLabel.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-31.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class PartitionLabel {
    func partitionLabels(_ S: String) -> [Int] {
        var lastPosition = [Int](repeating: 0, count: 26)
        let base = Character("a").asciiValue!
        for (position, char) in S.enumerated() {
            let indexAlphabet = Int(char.asciiValue! - base)
            lastPosition[indexAlphabet] = position
        }
        var offset = 0
        var last = 0
        var result = [Int]()
        for (i, char) in S.enumerated() {
            let indexAlphabet = Int(char.asciiValue! - base)
            last = max(last, lastPosition[indexAlphabet])
            if last == i {
                result.append(i - offset + 1)
                offset = i + 1
            }
        }
        return result
    }
}
