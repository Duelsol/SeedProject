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

    private var x: CGFloat = 0
    private var y: CGFloat = STATUSBAR_HEIGHT
    private var width: CGFloat = SCREEN_WIDTH
    private var height: CGFloat = SCREEN_HEIGHT - STATUSBAR_HEIGHT
    private var navigationBarHeight: CGFloat = 0
    private var tabBarHeight: CGFloat = isFaceIDCapable ? 34 : 0

    enum SideDirection {

        case top, bottom, left, right

    }

    func excludeNavigationBar() -> SafeArea {
        navigationBarHeight = NAVIGATIONBAR_HEIGHT
        return self
    }

    func excludeTabBar() -> SafeArea {
        tabBarHeight = TABBAR_HEIGHT
        return self
    }

    func exclude(from direction: SideDirection, value: CGFloat) -> SafeArea {
        if direction == .top {
            y += value
            height -= value
        } else if direction == .bottom {
            height -= value
        } else if direction == .left {
            x += value
            width -= value
        } else if direction == .right {
            width -= value
        }
        return self
    }

    func rect() -> CGRect {
        return CGRect(x: x, y: y + navigationBarHeight, width: width, height: height - navigationBarHeight - tabBarHeight)
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
