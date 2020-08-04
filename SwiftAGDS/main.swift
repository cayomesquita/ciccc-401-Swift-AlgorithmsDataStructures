//
//  main.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation
for j in 1...50 {
    let i = String(format: "%.2d", j)
    let testCase = "/Users/cornerstone/Workspace/WMAD/SwiftAGDS/SwiftAGDS/ProblemSolutions/Inputs/mcfTestCases/mcf.\(i)"
    if let url = URL.init(string: testCase) {
        print("\([Character](repeating: "-", count: 40).reduce("") {$0 + String.init($1)})")
        print("TestCase: \(url.lastPathComponent)")
    }
    print(MCF().solutionByInputFile(inFile: "\(testCase).in", outFile: "\(testCase).out"))
}




