//
//  Bridge.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-26.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class Bridge {
 
    var grid = [[Int]]() // -1 not visited, 0 water, 1..n island
    fileprivate let queue = Queue<(y: Int, x:Int)>.init()
    fileprivate let dy = [0, 0, 1, -1]
    fileprivate let dx = [1, -1, 0, 0]
    
    fileprivate func bfsFillIslands(_ gridIn: [[Int]]) -> [[Int]] {
        let size = gridIn.count
        var grid = [[Int]](repeating: [Int](repeating: -1, count: size), count: size)
        var tagIsland = 1
        for y in 0..<size {
            for x in 0..<size {
                if grid[y][x] < 0 { // not visited
                    grid[y][x] = 0
                    if gridIn[y][x] > 0 { // island
                        self.queue.enqueue(item: (y: y, x: x))
                        while let cell = self.queue.dequeue() {
                            let x = cell.x
                            let y = cell.y
                            grid[y][x] = tagIsland
                            for i in 0..<dy.count {
                                let ny = y + dy[i]
                                let nx = x + dx[i]
                                if ny >= 0, nx >= 0, ny < size, nx < size, grid[ny][nx] < 0 { // not visited
                                    if gridIn[ny][nx] > 0 {
                                        self.queue.enqueue(item: (y: ny, x: nx))
                                    } else {
                                        grid[ny][nx] = 0
                                    }
                                }
                            }
                        }
                        tagIsland += 1
                    }
                }
            }
        }
        return grid
    }
    
    fileprivate func bfsLowestDistance(_ y: Int, _ x: Int, _ size: Int, _ distance: inout Int) {
        var grid = self.grid
        let tag = grid[y][x]
        self.queue.enqueue(item: (y: y, x: x))
        while let cell = self.queue.dequeue() {
            let x = cell.x
            let y = cell.y
            let nDistance = grid[y][x] < 0 ? grid[y][x] - 1 : -1
            if distance != Int.max, abs(nDistance) > distance  {
                continue
            }
            for i in 0..<dy.count {
                let ny = y + dy[i]
                let nx = x + dx[i]
                if ny >= 0, nx >= 0, ny < size, nx < size{
                    if grid[ny][nx] == 0 {
                        self.queue.enqueue(item: (y: ny, x: nx))
                        grid[ny][nx] = nDistance
                    } else if grid[ny][nx] > 0, grid[ny][nx] != tag {
                        distance = min(distance, abs(grid[y][x]))
                    }
                }
            }
        }
//        print("")
//        print(Position.init(y: y, x: x))
//        for row in grid {
//            print(row)
//        }
    }
    
    func solution(grid gridIn: [[Int]]) -> Int {
        self.grid = bfsFillIslands(gridIn)
        let size = self.grid.count
        var distance = Int.max
        for y in 0..<size {
            for x in 0..<size {
                if self.grid[y][x] > 0 {
                    bfsLowestDistance(y, x, size, &distance)
                }
            }
        }
        return distance
    }
    
    func solutionByInputFile(inFile: String, outFile: String? = nil) -> Int {
        guard let lines = readFile(inFile) else {
            return -1
        }
        let size = Int(lines[0])!
        self.grid = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
        
        for h in 1...size {
            self.grid[h - 1] = lines[h].components(separatedBy: .whitespaces).map {Int($0)!}
        }
        
        let result = solution(grid: self.grid)
        
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
