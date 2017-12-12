//
//  AboutMeViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/16.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 自定义导航栏
        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("tabBar.aboutMe.title", comment: "")
        titleLabel.font = UIFont.systemFont(ofSize: NAVIGATIONBAR_TITLE_SIZE)
        titleLabel.textColor = NAVIGATIONBAR_TEXT_COLOR
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = titleLabel
        let customNavBar = createCustomNavBar(with: homePageNavItem, replaceOf: navigationController)
        view.addSubview(customNavBar)
    }

}
