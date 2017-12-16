//
//  HomePageViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/9/2.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import XLPagerTabStrip

class HomePageViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        // 设置XLPagerTabStrip
        settings.style.buttonBarBackgroundColor = UIColor.clear
        settings.style.buttonBarItemBackgroundColor = UIColor.clear
        settings.style.buttonBarItemTitleColor = NAVIGATIONBAR_TEXT_COLOR
        settings.style.selectedBarBackgroundColor = NAVIGATIONBAR_TEXT_COLOR
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0

        super.viewDidLoad()

        // 自定义导航栏
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = buttonBarView
        let customNavBar = createCustomNavBar(with: homePageNavItem, replaceOf: navigationController)
        view.addSubview(customNavBar)

        containerView.frame = SAFE_AREA
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let homePageNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageNews")
        let homePageTutorial = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageTutorial")
        let homePageEvaluation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageEvaluation")
        return [homePageNews, homePageTutorial, homePageEvaluation]
    }

}
