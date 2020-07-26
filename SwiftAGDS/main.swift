//
//  main.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation
for i in 1...25 {
    let testCase = "/Users/cornerstone/Workspace/WMAD/SwiftAGDS/SwiftAGDS/ProblemSolutions/Inputs/SushiTestCases/sushi.\(i)"
    print(SushiRestaurant().solutionByInputFile(inFile: "\(testCase).in", outFile: "\(testCase).out"))
}


