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

        for tabBarItem in tabBar.items! {
            switch tabBarItem.tag {
            case 0:
                tabBarItem.title = R.string.localizable.tabBarHomePageTitle()
            case 1:
                tabBarItem.title = R.string.localizable.tabBarCommunityTitle()
            case 2:
                tabBarItem.title = R.string.localizable.tabBarSearchTitle()
            case 3:
                tabBarItem.title = R.string.localizable.tabBarAboutMeTitle()
            default:
                break
            }
        }

        addThemeObserver()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension MainTabBarController: ThemeChangeProtocol {

    override func handleThemeChange() {
        super.handleThemeChange()
        tabBar.tintColor = ThemeManager.shared.getColor(ofElement: .tabBarItem)
        tabBar.barTintColor = ThemeManager.shared.getColor(ofElement: .tabBarText)
    }

}
