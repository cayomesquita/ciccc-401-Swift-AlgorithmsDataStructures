//
//  ReadUtil.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-20.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

func readFile(_ path: String) -> [String]? {
    guard FileManager.default.fileExists(atPath: path) else {
        return nil
    }
    do {
        let input = try String(contentsOfFile: path, encoding: .utf8)
        return input.components(separatedBy: .newlines)
    } catch  {
        print(error)
    }
    return nil
}

