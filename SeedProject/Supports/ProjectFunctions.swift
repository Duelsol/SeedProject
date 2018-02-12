//
//  ProjectGlobal.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/9/5.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation

/// Release版本过滤print输出内容
/// 需要在Swift Compiler - Custom Flags中的Active Compilation Conditions项增加DEBUG变量
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

/// 格式化打印日志
func log<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}

/// 延时调用
typealias Task = (_ cancel: Bool) -> Void

func delay(_ seconds: TimeInterval, task: @escaping () -> ()) -> Task? {
    func dispatch_later(block: @escaping () -> ()) {
        let delayTime = DispatchTime.now() + seconds
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: block)
    }

    var closure: (() -> Void)? = task
    var result: Task?

    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if cancel == false {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    result = delayedClosure

    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }

    return result
}

func cancel(_ task: Task?) {
    task?(true)
}

/// 并发锁
func synchronized(_ lock: AnyObject, closue: () -> ()) {
    objc_sync_enter(lock)
    closue()
    objc_sync_exit(lock)
}

/// 随机数
func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return Int(arc4random_uniform(count)) + range.lowerBound
}

/// 创建项目导航栏
func createCustomNavBar(with item: UINavigationItem? = nil, replaceOf default: UINavigationController? = nil) -> UINavigationBar {
    `default`?.setNavigationBarHidden(true, animated: false)
    `default`?.hidesNavigationBarHairline = true
    let customNavBar = CustomNavigationBar(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: NAVIGATIONBAR_HEIGHT + STATUSBAR_HEIGHT))
    customNavBar.barTintColor = NAVIGATIONBAR_BACKGROUND_COLOR
    customNavBar.tintColor = NAVIGATIONBAR_TEXT_COLOR
    customNavBar.isTranslucent = false
    customNavBar.shadowImage = UIImage()
    if item != nil {
        customNavBar.setItems([item!], animated: false)
    }
    return customNavBar
}
