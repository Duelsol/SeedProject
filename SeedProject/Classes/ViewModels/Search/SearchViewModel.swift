//
//  SearchViewModel.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/11/21.
//  Copyright © 2018 冯奕骅. All rights reserved.
//

import Foundation

struct SearchViewModel {

    static let shared = SearchViewModel()

    private init() {}

    let hotSearches: [String] = {
        return ["机械键盘", "filco", "周杰伦", "游戏机实用技术", "绝地求生", "手柄", "Switch", "Macbook"]
    }()

}
