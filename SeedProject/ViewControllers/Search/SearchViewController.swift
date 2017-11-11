//
//  SearchViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // 隐藏导航栏
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.hidesNavigationBarHairline = true
        // 自定义导航栏
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = searchController.searchBar
        let projectNavBar = createProjectNavBar(with: homePageNavItem)
        view.addSubview(projectNavBar)
    }

}
