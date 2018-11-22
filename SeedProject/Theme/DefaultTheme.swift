//
//  DefaultTheme.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/16.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

class DefaultTheme: ThemeProtocol {

    static let colorElements: [String: UIColor] = {
        return [
            "viewBackground": UIColor.white,
            "tabBarItem": UIColor.flatWatermelonColorDark(),
            "tabBarText": UIColor.white,
            "navigationBarBackground": UIColor.flatWatermelonColorDark(),
            "navigationBarText": UIColor.white
        ]
    }()

}
