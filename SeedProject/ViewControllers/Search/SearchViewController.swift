//
//  SearchViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit
import PYSearch

class SearchViewController: UIViewController {

    var searchViewController: PYSearchViewController?
    let searchResultTableView = UITableView()
    var searchResultData = [String]()
    let searchViewModel = SearchViewModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true

        searchViewController = PYSearchViewController(hotSearches: searchViewModel.hotSearches, searchBarPlaceholder: R.string.localizable.searchSearchBarPlaceholder(), didSearch: {
            searchViewController, searchBar, searchText in
            self.segueToDemo(title: searchText)
        })
        searchViewController!.delegate = self

        // 自定义导航栏
        let customNavBar = createCustomNavBar(with: UINavigationItem(), replaceOf: navigationController)
        view.addSubview(customNavBar)

        searchViewController!.view.frame = SafeArea().withNavigationBar().withTabBar().value()
        addChild(searchViewController!)
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

        addThemeObserver()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        for subview in view.subviews {
            if let navBar = subview as? UINavigationBar {
                navBar.items?[0].titleView = searchViewController!.searchBar
                break
            }
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension SearchViewController: ThemeChangeProtocol {

    override func handleThemeChange() {
        super.handleThemeChange()
        searchViewController!.searchBar.tintColor = ThemeManager.shared.getColor(ofElement: .navigationBarBackground)
    }

}

extension SearchViewController: PYSearchViewControllerDelegate {

    func searchViewController(_ searchViewController: PYSearchViewController!, searchTextDidChange searchBar: UISearchBar!, searchText: String!) {
        searchResultData.removeAll()
        let searchString = searchViewController.searchBar.text!
        searchResultTableView.isHidden = searchString.isEmpty
        for searchHistory in searchViewModel.hotSearches {
            if searchHistory.lowercased().contains(searchString.lowercased())
                || searchHistory.pinYin.lowercased().contains(searchString.lowercased()) {
                searchResultData.append(searchHistory)
            }
        }
        searchResultTableView.reloadData()
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.cellForRow(at: indexPath)
        if (cell == nil) {
            cell = UITableViewCell()
        }
        cell!.textLabel!.text = searchResultData[indexPath.row]
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let text = cell.textLabel!.text!
            searchViewController!.searchBar.text = text

            var searchHistories = (NSKeyedUnarchiver.unarchiveObject(withFile: searchViewController!.searchHistoriesCachePath) as? [String]) ?? [String]()
            if let index = searchHistories.index(of: text) {
                searchHistories.remove(at: index)
            }
            searchHistories.insert(text, at: 0)
            NSKeyedArchiver.archiveRootObject(searchHistories, toFile: searchViewController!.searchHistoriesCachePath)
            searchViewController!.setValue(searchHistories, forKey: "searchHistories")
            if let baseSearchTableView = searchViewController!.value(forKey: "baseSearchTableView") as? UITableView {
                baseSearchTableView.reloadData()
            }

            searchResultTableView.isHidden = true
            segueToDemo(title: text)
        }
    }

}

extension SearchViewController {

    private func segueToDemo(title: String?) {
        let destination = DemoViewController()
        destination.title = title
        navigationController?.pushViewController(destination, animated: true)
    }

}
