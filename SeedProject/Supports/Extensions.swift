//
//  ProjectExtensions.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/12/4.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation

protocol Formattable {

    /// 转化为NSNumber
    func number() -> NSNumber

    /// 格式化数字
    func format(_ pattern: String) -> String?

}

extension Formattable {

    func number() -> NSNumber {
        switch self {
        case is Int:
            return NSNumber(value: self as! Int)
        case is Double:
            return NSNumber(value: self as! Double)
        case is Float:
            return NSNumber(value: self as! Float)
        default:
            return NSNumber()
        }
    }

    func format(_ pattern: String = "#,##0.00") -> String? {
        let numberFormatter = FormatterHolder.number
        numberFormatter.positiveFormat = pattern
        return numberFormatter.string(from: number())
    }

}

protocol Fixable {

    /// 保留小数
    func fix(_ digits: Int) -> String

}

extension Int: Formattable {}

extension Double: Formattable, Fixable {

    func fix(_ digits: Int) -> String {
        return String(format: "%.\(digits)f", self)
    }

}

extension Float: Formattable, Fixable {

    func fix(_ digits: Int) -> String {
        return String(format: "%.\(digits)f", self)
    }

}

extension String {

    var isBlank: Bool {
        get {
            return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
        }
    }

    func matches(pattern: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self)
    }

    var isEmail: Bool {
        get {
            return self.matches(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")
        }
    }

    var isMobileNumber: Bool {
        get {
            return self.matches(pattern: "^\\d{11}$")
        }
    }

    /// 将文字转为拼音
    var pinYin: String {
        get {
            let string = NSMutableString(string: self)
            // 先转成带音标的拼音
            CFStringTransform(string, nil, kCFStringTransformToLatin, false)
            // 再转成去掉音标的拼音
            CFStringTransform(string, nil, kCFStringTransformStripDiacritics, false)
            return string.replacingOccurrences(of: " ", with: "")
        }
    }

    /// 从字符串解析日期
    func date(pattern: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = FormatterHolder.date
        dateFormatter.dateFormat = pattern
        return dateFormatter.date(from: self)
    }

}

extension Date {

    /// 格式化日期
    func string(pattern: String = "yyyy-MM-dd") -> String {
        let dateFormatter = FormatterHolder.date
        dateFormatter.dateFormat = pattern
        return dateFormatter.string(from: self)
    }

}

extension UIImage {

    /// 给UIImage初始化指定颜色
    class func initWithColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

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

extension NotificationCenter {

    func post(custom: CustomNotification, object: Any?) {
        self.post(name: custom.notificationName, object: object)
    }

}
