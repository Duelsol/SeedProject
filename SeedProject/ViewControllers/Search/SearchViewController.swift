//
//  SearchViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit
import PYSearch

class SearchViewController: UIViewController, PYSearchViewControllerDelegate {

    var searchViewController: PYSearchViewController?
    let searchResultTableView = UITableView()
    var searchResultData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true

        searchViewController = PYSearchViewController(hotSearches: DefaultData.hotSearches, searchBarPlaceholder: NSLocalizedString("search.searchBar.placeholder", comment: ""), didSearch: {
            searchViewController, searchBar, searchText in
        })
        searchViewController!.delegate = self
        searchViewController!.searchBar.tintColor = NAVIGATIONBAR_BACKGROUND_COLOR

        // 自定义导航栏
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = searchViewController!.searchBar
        let customNavBar = createCustomNavBar(with: homePageNavItem, replaceOf: navigationController)
        view.addSubview(customNavBar)

        searchViewController!.view.frame = CGRect(x: 0, y: customNavBar.frame.height, width: view.bounds.width, height: view.bounds.height)
        addChildViewController(searchViewController!)
        view.addSubview(searchViewController!.view)

        // 设置查询列表
        searchResultTableView.frame = searchViewController!.view.frame
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.isHidden = true
        searchResultTableView.keyboardDismissMode = .onDrag
        // 隐藏无数据行的分割线
        searchResultTableView.tableFooterView = UIView()
        view.addSubview(searchResultTableView)
    }

    func searchViewController(_ searchViewController: PYSearchViewController!, searchTextDidChange searchBar: UISearchBar!, searchText: String!) {
        searchResultData.removeAll()
        let searchString = searchViewController.searchBar.text!
        searchResultTableView.isHidden = searchString.isEmpty
        for searchHistory in DefaultData.hotSearches {
            if searchHistory.lowercased().contains(searchString.lowercased())
                || searchHistory.pinYin().lowercased().contains(searchString.lowercased()) {
                searchResultData.append(searchHistory)
            }
        }
        searchResultTableView.reloadData()
    }

}
