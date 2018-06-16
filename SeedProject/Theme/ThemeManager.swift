//
//  ThemeManager.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/15.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation

/// 主题枚举
enum ThemeEnum: String {

    case `default` = "DefaultTheme"

}

class ThemeManager {

    static let shared = ThemeManager()

    /// 默认从UserDefaults取上一次使用的主题
    private var current: ThemeEnum = {
        if let savedTheme = UserDefaults.standard.string(forKey: "CurrentTheme"), let theme = ThemeEnum(rawValue: savedTheme) {
            return theme
        }
        return .default
    }()

    private init() {}

    /// 切换主题
    func `switch`(to theme: ThemeEnum) {
        current = theme
        UserDefaults.standard.setValue(theme.rawValue, forKey: "CurrentTheme")
        NotificationCenter.default.post(custom: .willUpdateTheme, object: nil)
    }

    /// 获取与颜色相关的元素
    func getColor(ofElement element: ThemeColorElement) -> UIColor {
        guard let theme = obtainClass(byName: current.rawValue) as? ThemeProtocol.Type else {
            return UIColor.clear
        }
        return theme.colorElements[element.rawValue]!
    }

}

/// 主题更新协议，主要针对UIView和UIViewController
protocol ThemeUpdateProtocol {}

extension ThemeUpdateProtocol where Self: UIView {

    func addThemeObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme), name: CustomNotification.willUpdateTheme.notificationName, object: nil)
        updateTheme()
    }

}

extension ThemeUpdateProtocol where Self: UIViewController {

    func addThemeObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme), name: CustomNotification.willUpdateTheme.notificationName, object: nil)
        updateTheme()
    }

}

extension UIView {

    @objc func updateTheme() {}

}

extension UIViewController {

    @objc func updateTheme() {}

}