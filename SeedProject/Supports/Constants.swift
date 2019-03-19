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

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
let NAVIGATIONBAR_HEIGHT: CGFloat = 44
let NAVIGATIONBAR_TITLE_SIZE: CGFloat = 18

var safeAreaInsets: UIEdgeInsets {
    if #available(iOS 11.0, *) {
        return UIApplication.shared.delegate?.window??.safeAreaInsets ?? UIEdgeInsets.zero
    }
    return UIEdgeInsets.zero
}

class SafeArea {

    private var x: CGFloat = safeAreaInsets.left
    private var y: CGFloat = safeAreaInsets.top
    private var width: CGFloat = SCREEN_WIDTH - safeAreaInsets.left - safeAreaInsets.right
    private var height: CGFloat = SCREEN_HEIGHT - safeAreaInsets.top - safeAreaInsets.bottom
    private var navigationBarHeight: CGFloat = 0

    enum SideDirection {

        case top, bottom, left, right

    }

    func excludeNavigationBar() -> SafeArea {
        navigationBarHeight = NAVIGATIONBAR_HEIGHT
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
        return CGRect(x: x, y: y + navigationBarHeight, width: width, height: height - navigationBarHeight)
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
