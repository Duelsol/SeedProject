//
//  DefaultData.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/10.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation

struct DefaultData {

    static var newsCount = 20

    static let newsNextGrowingCount = 10

    static var newsContent: [String] = {
        var result = [String]()
        for i in 1...DefaultData.newsCount {
            result.append("内容\(i)")
        }
        return result
    }()

    static var hotSearches: [String] = {
        return ["机械键盘", "filco", "周杰伦", "游戏机实用技术", "绝地求生", "手柄", "Switch", "Macbook"]
    }()

}
