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
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0

        addThemeObserver()

        super.viewDidLoad()

        // 自定义导航栏
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = buttonBarView
        _ = createCustomNavigationBar(with: homePageNavItem)

        containerView.frame = SafeArea().excludeNavigationBar().excludeTabBar().rect()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let homePageNews = R.storyboard.main.homePageNews()!
        let homePageTutorial = R.storyboard.main.homePageTutorial()!
        let homePageEvaluation = R.storyboard.main.homePageEvaluation()!
        return [homePageNews, homePageTutorial, homePageEvaluation]
    }

}

extension HomePageViewController: ThemeChangeProtocol {

    override func handleThemeChange() {
        super.handleThemeChange()
        settings.style.buttonBarItemTitleColor = ThemeManager.shared.currentTheme().navigationBarText
        settings.style.selectedBarBackgroundColor = ThemeManager.shared.currentTheme().navigationBarText
    }

}
