//
//  CustomNotification.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/3/8.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

enum CustomNotification: String {

    case themeWillChange
    case networkNotReachable

    var stringValue: String {
        return rawValue + "CustomNotification"
    }

    var notificationName: NSNotification.Name {
        return NSNotification.Name(stringValue)
    }

}

extension NotificationCenter {

    func post(custom: CustomNotification, object: Any?) {
        self.post(name: custom.notificationName, object: object)
    }

}
