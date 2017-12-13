//
//  DefaultData.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/10.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation

struct DefaultData {

    static let newsNextGrowingCount = 10

    static var news: [String] = {
        var result = [String]()
        for i in 1 ... 20 {
            result.append("新闻\(i)")
        }
        return result
    }()

    static let communities: [String: [String]] = {
        var sections = [String: [String]]()
        for i in 1 ... 5 {
            var cells = [String]()
            for j in 1 ... 4 {
                cells.append("单元\(j)")
            }
            sections.updateValue(cells, forKey: "分类\(i)")
        }
        return sections
    }()

    static var hotSearches: [String] = {
        return ["机械键盘", "filco", "周杰伦", "游戏机实用技术", "绝地求生", "手柄", "Switch", "Macbook"]
    }()

}
