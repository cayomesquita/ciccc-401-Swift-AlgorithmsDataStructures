//
//  WhoIsMyParent.swift
//  SwiftAGDS
//
//  Created by Cornerstone on 2020-07-20.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class WhoIsMyParent {
    
    fileprivate func preProcess(edges: [Int:[Int]], parentDic: inout [Int:Int]) {
        parentDic[1] = -1
        preProcessHelper(node: 1, edges: edges, parentDic: &parentDic)
    }
    
    fileprivate func preProcessHelper(node: Int, edges: [Int:[Int]], parentDic: inout [Int:Int]) {
        if let children = edges[node], let parent = parentDic[node] {
            for child in children {
                if child != parent {
                    parentDic[child] = node
                    preProcessHelper(node: child, edges: edges, parentDic: &parentDic)
                }
            }
            
        }
    }
 
    func solution(edges edgesIn: [Int:[Int]]) {
        var parentDic = [Int:Int]()
        preProcess(edges: edgesIn, parentDic: &parentDic)
        for num in 2...parentDic.count {
            print(parentDic[num]!)
        }
    }
        
    func solutionByInputFile(path: String) {
        if let lines = readFile(path), let numEdges = Int(lines[0]) {
            var edgeDic = [Int:[Int]]()
            for i in 1..<numEdges {
                let arr = lines[i].components(separatedBy: .whitespaces)
                let a = Int(arr.first!)!
                let b = Int(arr.last!)!
                if let aux = edgeDic[a] {
                    var arr = aux
                    arr.append(b)
                    edgeDic[a] = arr
                } else {
                    edgeDic[a] = [b]
                }
                if let aux = edgeDic[b] {
                    var arr = aux
                    arr.append(a)
                    edgeDic[b] = arr
                } else {
                    edgeDic[b] = [a]
                }
            }
            solution(edges: edgeDic)
        }
        
    }
}
