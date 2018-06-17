//
//  DemoViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/16.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController, ThemeChangeProtocol {

    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 自定义导航栏
        titleLabel.text = title
        let navItem = UINavigationItem()
        navItem.titleView = titleLabel
        navItem.leftBarButtonItem = UIBarButtonItem(image: R.image.arrowLeft(), style: .plain, target: self, action: #selector(backTapped))
        let customNavBar = createCustomNavBar(with: navItem, replaceOf: navigationController)
        view.addSubview(customNavBar)

        addThemeObserver()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 右滑返回
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func handleThemeChange() {
        super.handleThemeChange()
        view.backgroundColor = ThemeManager.shared.getColor(ofElement: .viewBackground)
        titleLabel.textColor = ThemeManager.shared.getColor(ofElement: .navigationBarText)
    }

    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }

}
