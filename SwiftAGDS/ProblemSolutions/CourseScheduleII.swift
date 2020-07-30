//
//  CourseScheduleII.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-29.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class CourseScheduleII {
    
    func solution(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        let queue = Queue<Int>.init()
        var arrTopology = [[Int]](repeating: [Int](), count: numCourses)
        var arrCount = [Int](repeating: 0, count: numCourses)
        var sequence = [Int]()
        var numCoursesUncompleted = numCourses
        
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
            numCoursesUncompleted -= 1
            for u in arrTopology[v] {
                arrCount[u] -= 1
                if arrCount[u] == 0 {
                    queue.enqueue(item: u)
                }
            }
            arrTopology[v].removeAll()
            sequence.append(v)
        }
        return numCoursesUncompleted > 0 ? [] : sequence
    }
    
    func solutionByInputFile(inFile: String, outFile: String? = nil) -> [Int] {
        guard let lines = readFile(inFile) else {
            return []
        }
        let numVertices = Int(lines[0])!
        let groups = lines[1].groups(for: "\\[(\\s*\\d\\s*,\\s*\\d\\s*)\\]")
        var arr = groups.map { $0[1].components(separatedBy: ",").map { Int($0)! } }
        let result = solution(numVertices, arr)
        
//       if let outFile = outFile, let line = readFile(outFile)?.first, let answer = Bool(line) {
//           if result == answer {
//               print("Success")
//           } else {
//               print("Fail (expected:\(answer) - result:\(result))")
//           }
//       }
        return result
    }
}

extension String {
    func groups(for regexPattern: String) -> [[String]] {
    do {
        let text = self
        let regex = try NSRegularExpression(pattern: regexPattern)
        let matches = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return matches.map { match in
            return (0..<match.numberOfRanges).map {
                let rangeBounds = match.range(at: $0)
                guard let range = Range(rangeBounds, in: text) else {
                    return ""
                }
                return String(text[range])
            }
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
}
