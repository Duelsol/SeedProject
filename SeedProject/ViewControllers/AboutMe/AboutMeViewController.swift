//
//  AboutMeViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/16.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView()
    let aboutMeCover = UIImageView(image: UIImage(named: "aboutme-cover")!)
    var customNavBar: UINavigationBar?
    let coverHeight = STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT * 3
    let alphaOffset: CGFloat = 44

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        // 设置可滚动区域
        scrollView.contentSize = CGSize(width: 0, height: SCREEN_HEIGHT * 2)
        // 上方留出高度放封面图片
        scrollView.contentInset = UIEdgeInsets(top: coverHeight, left: 0, bottom: 0, right: 0)
        // 初始滚动位置
        scrollView.contentOffset = CGPoint(x: 0, y: -coverHeight)
        // 不自动调整内边距
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        scrollView.delegate = self
        view.addSubview(scrollView)

        // 个人主页封面
        aboutMeCover.frame = CGRect(x: 0, y: -coverHeight, width: SCREEN_WIDTH, height: coverHeight)
        aboutMeCover.contentMode = .scaleAspectFill
        scrollView.addSubview(aboutMeCover)

        // 自定义导航栏
        let shareBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: nil, action: nil)
        let homePageNavItem = UINavigationItem()
        homePageNavItem.rightBarButtonItem = shareBarButtonItem
        customNavBar = createCustomNavBar(with: homePageNavItem, replaceOf: navigationController)
        customNavBar!.isTranslucent = true
        // 背景透明
        let color = UIColor(hexString: NAVIGATIONBAR_BACKGROUND_COLOR.hexValue(), withAlpha: 0)
        customNavBar!.setBackgroundImage(UIImage.initWithColor(color!), for: .default)
        view.addSubview(customNavBar!)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y - scrollView.layoutMargins.top
        if offsetY >= -(STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT) {
            customNavBar!.isTranslucent = false
        }
        // 下拉放大
        else if offsetY <= -coverHeight {
            customNavBar!.isTranslucent = true
            var frame = scrollView.frame
            frame.origin.y = offsetY
            frame.size.height = -offsetY
            aboutMeCover.frame = frame
        }
        // 上拉渐变
        else if offsetY >= -(STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT + alphaOffset) {
            customNavBar!.isTranslucent = true
            let alpha = (offsetY + coverHeight - alphaOffset) / alphaOffset
            let color = UIColor(hexString: NAVIGATIONBAR_BACKGROUND_COLOR.hexValue(), withAlpha: alpha)
            customNavBar!.setBackgroundImage(UIImage.initWithColor(color!), for: .default)
        }
    }

}
