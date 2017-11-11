//
//  HomePageRecommendViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/9/2.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import XLPagerTabStrip

class HomePageTutorialViewController: UIViewController, IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: NSLocalizedString("homePage.tutorial", comment: ""))
    }
    
}
