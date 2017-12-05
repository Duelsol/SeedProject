//
//  ProjectSettings.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import Foundation
import DeviceKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
let NAVIGATIONBAR_HEIGHT: CGFloat = Device().isOneOf([.iPhoneX, .simulator(.iPhoneX)]) ? 88 : 64
let TABBAR_HEIGHT: CGFloat = Device().isOneOf([.iPhoneX, .simulator(.iPhoneX)]) ? 83 : 49

let VIEW_BACKGROUND_COLOR = UIColor.white

let TABBAR_ITEM_COLOR = UIColor.flatWatermelonColorDark()
let TABBAR_TEXT_COLOR = UIColor.white

let NAVIGATIONBAR_BACKGROUND_COLOR = UIColor.flatWatermelonColorDark()
let NAVIGATIONBAR_TEXT_COLOR = UIColor.white
