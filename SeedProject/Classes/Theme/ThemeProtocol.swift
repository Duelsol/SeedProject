//
//  ThemeProtocol.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/15.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

/// 主题协议，定义了每个主题所有的元素
protocol ThemeProtocol {

    init()

    var viewBackground: UIColor { get }

    var tabBarItem: UIColor { get }

    var tabBarText: UIColor { get }

    var navigationBarBackground: UIColor { get }

    var navigationBarText: UIColor { get }

}

/// 提供主题元素的默认值
extension ThemeProtocol {

    var viewBackground: UIColor {
        return UIColor.white
    }

    var tabBarItem: UIColor {
        return UIColor.flatWatermelonColorDark()
    }

    var tabBarText: UIColor {
        return UIColor.white
    }

    var navigationBarBackground: UIColor {
        return UIColor.flatWatermelonColorDark()
    }

    var navigationBarText: UIColor {
        return UIColor.white
    }

}
