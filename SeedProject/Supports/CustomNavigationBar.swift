//
//  CustomNavigationBar.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {

    /// 解决iOS11布局错乱问题
    override func layoutSubviews() {
        super.layoutSubviews()

        for subview in subviews {
            let className = String(describing: subview.self)
            if className.contains("Background") {
                subview.frame = bounds
            } else if className.contains("ContentView") {
                var frame = subview.frame
                frame.origin.y = UIApplication.shared.statusBarFrame.height
                frame.size.height = bounds.size.height - frame.origin.y
                subview.frame = frame
            }
        }

        addThemeObserver()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension CustomNavigationBar: ThemeChangeProtocol {

    override func handleThemeChange() {
        super.handleThemeChange()
        barTintColor = ThemeManager.shared.getColor(ofElement: .navigationBarBackground)
        tintColor = ThemeManager.shared.getColor(ofElement: .navigationBarText)
    }

}

/// 创建项目导航栏
func createCustomNavBar(with item: UINavigationItem? = nil, replaceOf default: UINavigationController? = nil) -> UINavigationBar {
    `default`?.setNavigationBarHidden(true, animated: false)
    `default`?.hidesNavigationBarHairline = true
    let customNavBar = CustomNavigationBar(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: NAVIGATIONBAR_HEIGHT + STATUSBAR_HEIGHT))
    customNavBar.isTranslucent = false
    customNavBar.shadowImage = UIImage()
    if item != nil {
        customNavBar.setItems([item!], animated: false)
    }
    return customNavBar
}
