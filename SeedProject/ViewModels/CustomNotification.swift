//
//  CustomNotification.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/3/8.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

enum CustomNotification: String {

    case demo

    var stringValue: String {
        return "Custom" + rawValue
    }

    var notificationName: NSNotification.Name {
        return NSNotification.Name(stringValue)
    }

}
