//
//  CustomNotification.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/3/8.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

enum CustomNotification: String {

    case willUpdateTheme

    var stringValue: String {
        return rawValue + "CustomNotification"
    }

    var notificationName: NSNotification.Name {
        return NSNotification.Name(stringValue)
    }

}
