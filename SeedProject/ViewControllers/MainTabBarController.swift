//
//  MainTabBarController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/9/6.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = TABBAR_ITEM_COLOR
        tabBar.barTintColor = TABBAR_TEXT_COLOR

        for tabBarItem in tabBar.items! {
            switch tabBarItem.tag {
            case 0:
                tabBarItem.title = NSLocalizedString("tabBar.homePage.title", comment: "")
            case 1:
                tabBarItem.title = NSLocalizedString("tabBar.community.title", comment: "")
            case 2:
                tabBarItem.title = NSLocalizedString("tabBar.search.title", comment: "")
            case 3:
                tabBarItem.title = NSLocalizedString("tabBar.aboutMe.title", comment: "")
            default:
                break
            }
        }
    }

}
