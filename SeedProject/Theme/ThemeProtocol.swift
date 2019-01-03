//
//  ThemeProtocol.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/15.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

/// 主题协议，定义了每个主题需要提供的元素
protocol ThemeProtocol {

    init()

    var viewBackground: UIColor { get }

    var tabBarItem: UIColor { get }

    var tabBarText: UIColor { get }

    var navigationBarBackground: UIColor { get }

    var navigationBarText: UIColor { get }

}
