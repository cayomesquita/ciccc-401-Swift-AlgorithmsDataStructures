//
//  main.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation
for i in 1...5 {
    let testCase = "/Users/cornerstone/Workspace/WMAD/SwiftAGDS/SwiftAGDS/ProblemSolutions/Inputs/TomatoFarm/tomatoFarm.\(i)"
    if let url = URL.init(string: testCase) {
        print("\([Character](repeating: "-", count: 40).reduce("") {$0 + String.init($1)})")
        print("TestCase: \(url.lastPathComponent)")
    }
    print(TomatoFarm().solutionByInputFile(inFile: "\(testCase).in", outFile: "\(testCase).out"))
}


