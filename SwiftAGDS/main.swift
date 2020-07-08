//
//  main.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-06-23.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

print("Hello, World!")
var board = Board.init(size: 8)
print("Number of recursive calls: \(solveQueens(board: &board))")



