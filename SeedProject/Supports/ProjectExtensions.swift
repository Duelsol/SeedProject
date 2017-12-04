//
//  ProjectExtensions.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/12/4.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation

extension String {

    /// 将文字转为拼音
    func pinYin() -> String {
        let string = NSMutableString(string: self)
        // 先转成带音标的拼音
        CFStringTransform(string, nil, kCFStringTransformToLatin, false)
        // 再转成去掉音标的拼音
        CFStringTransform(string, nil, kCFStringTransformStripDiacritics, false)
        return string.replacingOccurrences(of: " ", with: "")
    }

}
