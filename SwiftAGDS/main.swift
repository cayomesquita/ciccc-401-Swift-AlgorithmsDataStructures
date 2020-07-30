//
//  main.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation
for i in 1...2 {
    let testCase = "/Users/cornerstone/Workspace/WMAD/SwiftAGDS/SwiftAGDS/ProblemSolutions/Inputs/CourseScheduleIITestCases/courseScheduleII.\(i)"
    if let url = URL.init(string: testCase) {
        print("\([Character](repeating: "-", count: 40).reduce("") {$0 + String.init($1)})")
        print("TestCase: \(url.lastPathComponent)")
    }
    print(CourseScheduleII().solutionByInputFile(inFile: "\(testCase).in", outFile: "\(testCase).out"))
}

//var uf = UF.init(10)
//print(uf)
//uf.union(2, 8)
//print(uf)
//uf.union(2, 3)
//print(uf)
//uf.union(1, 0)
//print(uf)
//uf.union(1, 4)
//print(uf)
//uf.union(4, 5)
//print(uf)
//uf.union(4, 6)
//print(uf)
//uf.union(4, 9)
//print(uf)
//uf.union(2, 7)
//print(uf)
//uf.union(7, 6)
//print(uf)
//print(uf.find(3))
//print(uf.find(8))
//print(uf.find(0))
//print(uf.find(9))



