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

extension UIImage {

    /// 给UIImage添加圆角
    func drawRectWithRoundedCorner(size: CGSize, radius: CGFloat) -> UIImage {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        let context = UIGraphicsGetCurrentContext()!

        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        context.addPath(UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath)
        UIGraphicsGetCurrentContext()!.clip()
        draw(in: rect)
        context.drawPath(using: .fillStroke)

        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return output!
    }

}

extension UIImageView {

    func addCorner(radius: CGFloat) {
        image = image?.drawRectWithRoundedCorner(size: bounds.size, radius: radius)
    }

}
