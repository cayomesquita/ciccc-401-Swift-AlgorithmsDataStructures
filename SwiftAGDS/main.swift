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
    , [(0,1), (1,2), (2,3)]
]

let graph2: [[(v: Int, w: Int)]] = [[(1,7), (3,5)]
    , [(0,7), (2,8), (3,9), (4,7)]
    , [(1,8), (4,5)]
    , [(0,5), (1,9), (4,15), (5,6)]
    , [(1,7), (2,5), (3,15), (5,8), (6,9)]
    , [(3,6), (4,8), (6,11)]
    , [(4,9), (5,11)]
]

let mst = MST()
print(mst.primMST(graph))
print(mst.kruskalMST(graph))
print(mst.primMST(graph2))
print(mst.kruskalMST(graph2))



