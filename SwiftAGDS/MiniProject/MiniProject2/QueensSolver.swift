//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
func solveQueens(board: inout Board, rowIndex: Int = 0) -> Int {
	count += 1
    if rowIndex < board.size {
        for collumnIndex in 0..<board.size {
            if board.isSafe(row: rowIndex, col: collumnIndex) {
                board.place(row: rowIndex, col: collumnIndex)
                solveQueens(board: &board, rowIndex: rowIndex + 1)
                board.remove(row: rowIndex, col: collumnIndex)
            }
        }
    } else {
        print(board, terminator: "\n")
//        count += 1
    }
	return count
}

