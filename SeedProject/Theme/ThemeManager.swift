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

    var instance: ThemeProtocol {
        get {
            guard let theme = obtainClass(byName: self.rawValue) as? ThemeProtocol.Type else {
                return DefaultTheme()
            }
            return theme.init()
        }
    }

}

class ThemeManager {

    static let shared = ThemeManager()

    /// 默认从UserDefaults取上一次使用的主题
    private var current: ThemeProtocol = {
        if let savedTheme = UserDefaults.standard.string(forKey: "CurrentTheme"), let theme = ThemeEnum(rawValue: savedTheme) {
            return theme.instance
        }
        return ThemeEnum.default.instance
    }()

    private init() {}

    func currentTheme() -> ThemeProtocol {
        return current
    }

    /// 改变主题
    func change(to theme: ThemeEnum) {
        current = theme.instance
        UserDefaults.standard.setValue(theme.rawValue, forKey: "CurrentTheme")
        NotificationCenter.default.post(custom: .themeWillChange, object: nil)
    }

}

/// 主题更新协议，主要针对UIView和UIViewController
protocol ThemeChangeProtocol {}

extension ThemeChangeProtocol where Self: UIView {

    func addThemeObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleThemeChange), name: CustomNotification.themeWillChange.notificationName, object: nil)
        handleThemeChange()
    }

}

extension ThemeChangeProtocol where Self: UIViewController {

    func addThemeObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleThemeChange), name: CustomNotification.themeWillChange.notificationName, object: nil)
        handleThemeChange()
    }

}

extension UIView {

    @objc func handleThemeChange() {}

}

extension UIViewController {

    @objc func handleThemeChange() {}

}
