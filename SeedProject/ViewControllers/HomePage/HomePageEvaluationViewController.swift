//
//  HomePageEvaluationViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/9/5.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import XLPagerTabStrip

class HomePageEvaluationViewController: UIViewController, IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: NSLocalizedString("homePage.evaluation.title", comment: ""))
    }

}
