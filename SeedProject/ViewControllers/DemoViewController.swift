//
//  DemoViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/16.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 自定义导航栏
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = NAVIGATIONBAR_TEXT_COLOR
        let navItem = UINavigationItem()
        navItem.titleView = titleLabel
        navItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow-left"), style: .plain, target: self, action: #selector(backTapped))
        let customNavBar = createCustomNavBar(with: navItem, replaceOf: navigationController)
        view.addSubview(customNavBar)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 右滑返回
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }

    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }

}
