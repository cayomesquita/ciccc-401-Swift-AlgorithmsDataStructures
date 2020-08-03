//
//  main.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation
//for i in 1...2 {
//    let testCase = "/Users/cornerstone/Workspace/WMAD/SwiftAGDS/SwiftAGDS/ProblemSolutions/Inputs/CourseScheduleIITestCases/courseScheduleII.\(i)"
//    if let url = URL.init(string: testCase) {
//        print("\([Character](repeating: "-", count: 40).reduce("") {$0 + String.init($1)})")
//        print("TestCase: \(url.lastPathComponent)")
//    }
//    print(CourseScheduleII().solutionByInputFile(inFile: "\(testCase).in", outFile: "\(testCase).out"))
//}

let graph: [[(v: Int, w: Int)]] = [[(1,2), (3,1)]
    , [(0,2), (3,2)]
    , [(3,3)]
    , [(0,1), (1,2), (2,3)]]

print(MST().primMST(graph))


