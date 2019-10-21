//
//  CommunityViewModel.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/11/21.
//  Copyright © 2018 冯奕骅. All rights reserved.
//

import Foundation

struct CommunityViewModel {

    static let shared = CommunityViewModel()

    private init() {}

    let data: [[String: [String]]] = {
        var sections = [[String: [String]]]()
        for i in 1 ... 5 {
            var cells = [String]()
            for j in 1 ... 4 {
                cells.append("单元\(j)")
            }
            sections.append(["分类\(i)": cells])
        }
        return sections
    }()

}
