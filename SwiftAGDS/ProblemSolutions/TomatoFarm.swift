//
//  TomatoFarm.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-26.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class TomatoFarm {
    
    var box = [[Int]]()
    
    func solution(boxTomato boxIn: [[Int]]) -> Int {
        box = boxIn
        var count = 0
        var unRipe = 0
        var level = [[Int]](repeating: [Int](repeating: count, count: box.first!.count), count: box.count)
        
        let queue = Queue<(row: Int, column: Int)>.init()
        let dx = [1, -1, 0, 0]
        let dv = [0, 0, 1, -1]
        for row in 0..<box.count {
            for column in 0..<box[row].count {
                if box[row][column] > 0 {
                    queue.enqueue(item: (row: row, column: column))
                } else if box[row][column] == 0 {
                    unRipe += 1
                }
            }
        }
        while let ripeTomatoPosition = queue.dequeue() {
            for i in 0..<dx.count {
                let ny = ripeTomatoPosition.row + dv[i]
                let nx = ripeTomatoPosition.column + dx[i]
                if ny >= 0, nx >= 0, ny < box.count, nx < box.first!.count {
                    let nTomatoPosition = (row: ny, column: nx)
                    if box[nTomatoPosition.row][nTomatoPosition.column] == 0 {
                        unRipe -= 1
                        box[nTomatoPosition.row][nTomatoPosition.column] = -1
                        count = level[ripeTomatoPosition.row][ripeTomatoPosition.column] + 1
                        level[nTomatoPosition.row][nTomatoPosition.column] = count
                        queue.enqueue(item: nTomatoPosition)
                    }
                }
            }
        }
        return unRipe > 0 ? -1 : count
    }
    
    func solutionByInputFile(inFile: String, outFile: String? = nil) -> Int {
        guard let lines = readFile(inFile) else {
            return -1
        }
        let header = lines[0].components(separatedBy: .whitespaces).map {Int($0)!}
        let width = header.first!
        let height = header.last!
        box = [[Int]](repeating: [Int](repeating: 0, count: width), count: height)
        
        for h in 1...height {
            box[h - 1] = lines[h].components(separatedBy: .whitespaces).map {Int($0)!}
        }
        
        let result = solution(boxTomato: box)
        
        if let outFile = outFile, let line = readFile(outFile)?.first, let answer = Int(line) {
            if result == answer {
                print("Success")
            } else {
                print("Fail (expected:\(answer) - result:\(result))")
            }
        }
        return result
    }
}
