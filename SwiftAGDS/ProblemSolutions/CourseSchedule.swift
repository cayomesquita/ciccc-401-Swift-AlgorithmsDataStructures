//
//  CourseSchedule.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-29.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class CourseSchedule {
    
    func solution(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        let queue = Queue<Int>.init()
        var arrTopology = [[Int]](repeating: [Int](), count: numCourses)
        var arrCount = [Int](repeating: 0, count: numCourses)
        
        for pair in prerequisites {
            let u = pair.first!
            let v = pair.last!
            arrTopology[v].append(u)
            arrCount[u] += 1
        }
        for i in 0..<arrCount.count {
            if arrCount[i] == 0 {
                queue.enqueue(item: i)
            }
        }
        while let v = queue.dequeue() {
            for u in arrTopology[v] {
                arrCount[u] -= 1
                if arrCount[u] == 0 {
                    queue.enqueue(item: u)
                }
            }
            arrTopology[v].removeAll()
        }
        return !(arrCount.max()! > 0)
    }
       
   func solutionByInputFile(inFile: String, outFile: String? = nil) -> Bool {
        guard let lines = readFile(inFile) else {
            return false
        }
        let numVertices = Int(lines[0])!
        var arr = [[Int]]()
        for i in 1..<(lines.count - 1) {
            let pair = lines[i].components(separatedBy: .whitespaces).map {Int($0)!}
            arr.append(pair)
        }

       let result = solution(numVertices, arr)

       if let outFile = outFile, let line = readFile(outFile)?.first, let answer = Bool(line) {
           if result == answer {
               print("Success")
           } else {
               print("Fail (expected:\(answer) - result:\(result))")
           }
       }
       return result
   }
}
