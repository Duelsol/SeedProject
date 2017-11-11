//
//  ProjectGlobal.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/9/5.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation
import DeviceKit

/// To use the  #if DEBUG macro then you have to define
/// the "Swift Compiler - Custom Flags -Other Flags" to contain the value -D DEBUG
func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        var startIndex = items.startIndex
        let endIndex = items.endIndex
        repeat {
            Swift.print(items[startIndex], separator: separator, terminator: startIndex + 1 == endIndex ? terminator : separator)
            startIndex += 1
        }
        while startIndex < endIndex
    #endif
}

/// 延时调用
func after(inSeconds seconds: Double, closure: @escaping () -> ()) {
    let delayTime = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: delayTime, execute: closure)
}

/// 创建项目导航栏
func createProjectNavBar(with item: UINavigationItem) -> UINavigationBar {
    let device = Device()
    let width = UIApplication.shared.keyWindow!.rootViewController!.view.bounds.width
    let height: CGFloat = (device == .iPhoneX || device == .simulator(.iPhoneX)) ? 88 : 64
    let projectNavBar = CustomNavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: height))
    projectNavBar.barTintColor = NAVIGATIONBAR_BACKGROUND_COLOR
    projectNavBar.tintColor = NAVIGATIONBAR_TEXT_COLOR
    projectNavBar.setItems([item], animated: false)
    return projectNavBar
}
