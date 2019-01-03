//
//  DefaultTheme.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/16.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

class DefaultTheme: ThemeProtocol {

    required init() {}

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
