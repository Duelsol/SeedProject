//
//  ProjectSettings.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation
import DeviceKit

/// Device

let isFaceIDCapable = {
    return Device().realDevice.isFaceIDCapable
}()

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
let STATUSBAR_HEIGHT: CGFloat = isFaceIDCapable ? 44 : 20
let NAVIGATIONBAR_HEIGHT: CGFloat = 44
let NAVIGATIONBAR_TITLE_SIZE: CGFloat = 18
let TABBAR_HEIGHT: CGFloat = isFaceIDCapable ? 83 : 49

class SafeArea {

    private var navigationBarHeight: CGFloat = 0
    private var tabBarHeight: CGFloat = isFaceIDCapable ? 34 : 0

    func withNavigationBar() -> SafeArea {
        navigationBarHeight = NAVIGATIONBAR_HEIGHT
        return self
    }

    func withTabBar() -> SafeArea {
        tabBarHeight = TABBAR_HEIGHT
        return self
    }

    func value() -> CGRect {
        return CGRect(x: 0, y: STATUSBAR_HEIGHT + navigationBarHeight, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - STATUSBAR_HEIGHT - navigationBarHeight - tabBarHeight)
    }

}

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
