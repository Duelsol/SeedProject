//
//  CommunityViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 自定义导航栏
        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("tabBar.community.title", comment: "")
        titleLabel.textColor = NAVIGATIONBAR_TEXT_COLOR
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = titleLabel
        let customNavBar = createCustomNavBar(with: homePageNavItem, replaceOf: navigationController)
        view.addSubview(customNavBar)
    }

}
