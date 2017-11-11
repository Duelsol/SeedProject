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
        for subView in subviews {
            let clazzName = String(describing: subView.self)
            if clazzName.contains("Background") {
                subView.frame = bounds
            } else if clazzName.contains("ContentView") {
                var frame = subView.frame
                frame.origin.y = UIApplication.shared.statusBarFrame.height
                frame.size.height = bounds.size.height - frame.origin.y
                subView.frame = frame
            }
        }
    }

}
