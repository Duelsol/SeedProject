//
//  SearchViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {

    var searchController = UISearchController(searchResultsController: nil)
    var searchResultTableView = UITableView()
    var searchResultData: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置搜索框
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.setValue(NSLocalizedString("search.searchBar.cancelText", comment: ""), forKey: "_cancelButtonText")
        definesPresentationContext = true

        // 自定义导航栏
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = searchController.searchBar
        let customNavBar = createCustomNavBar(with: homePageNavItem, replaceOf: navigationController)
        view.addSubview(customNavBar)

        // 设置查询列表
        searchResultTableView.frame = CGRect(x: 0, y: customNavBar.frame.height, width: view.bounds.width, height: view.bounds.height)
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.isHidden = true
        view.addSubview(searchResultTableView)
    }

    func didPresentSearchController(_ searchController: UISearchController) {
        searchController.searchBar.becomeFirstResponder()
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            if let index = DefaultData.searchHistory.index(of: text) {
                DefaultData.searchHistory.remove(at: index)
            }
            DefaultData.searchHistory.insert(text, at: 0)
        }
    }

    func updateSearchResults(for searchController: UISearchController) {
        searchResultData.removeAll()
        let searchString = searchController.searchBar.text!
        searchResultTableView.isHidden = searchString.isEmpty
        for searchHistory in DefaultData.searchHistory {
            if searchHistory.lowercased().contains(searchString.lowercased()) {
                searchResultData.append(searchHistory)
            }
        }
        searchResultTableView.reloadData()
    }

}
