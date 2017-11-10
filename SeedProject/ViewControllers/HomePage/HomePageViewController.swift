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
        // 隐藏导航栏
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.hidesNavigationBarHairline = true
        // 自定义导航栏
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = buttonBarView
        let projectNavBar = createProjectNavBar(with: homePageNavItem)
        view.addSubview(projectNavBar)

        // 设置XLPagerTabStrip
        settings.style.buttonBarBackgroundColor = UIColor.clear
        settings.style.buttonBarItemBackgroundColor = UIColor.clear
        settings.style.buttonBarItemTitleColor = UIColor.white
        settings.style.selectedBarBackgroundColor = UIColor.white
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0

        super.viewDidLoad()
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let homePageNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homePageNews")
        let homePageTutorial = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homePageTutorial")
        let homePageEvaluation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homePageEvaluation")
        return [homePageNews, homePageTutorial, homePageEvaluation]
    }

}
