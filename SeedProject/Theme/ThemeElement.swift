//
//  Themes.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/15.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

/// 每个主题中与颜色相关的元素枚举
enum ThemeColorElement: String {

    case viewBackground
    case tabBarItem
    case tabBarText
    case navigationBarBackground
    case navigationBarText

}

/// 主题协议，定义了每个主题需要提供的元素
protocol ThemeProtocol {

    static var colorElements: [String: UIColor] { get }

}
