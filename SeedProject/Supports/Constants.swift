//
//  ProjectSettings.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation
import DeviceKit

/// Size

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
let STATUSBAR_HEIGHT: CGFloat = Device().isOneOf([.iPhoneX, .simulator(.iPhoneX)]) ? 44 : 20
let NAVIGATIONBAR_HEIGHT: CGFloat = 44
let NAVIGATIONBAR_TITLE_SIZE: CGFloat = 18
let TABBAR_HEIGHT: CGFloat = Device().isOneOf([.iPhoneX, .simulator(.iPhoneX)]) ? 83 : 49
let SAFE_AREA = CGRect(x: 0, y: STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - STATUSBAR_HEIGHT - NAVIGATIONBAR_HEIGHT - TABBAR_HEIGHT)

/// Network

let BASE_URL = "https://easy-mock.com/mock/5950a2419adc231f356a6636/vue-admin"

/// Formatter

fileprivate let numberFormatter = NumberFormatter()
fileprivate let dateFormatter = DateFormatter()

struct FormatterHolder {

    static let number: NumberFormatter = {
        numberFormatter.locale = Locale(identifier: "zh_CN")
        return numberFormatter
    }()
    static let date: DateFormatter = {
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()

    private init() {}
    
}
