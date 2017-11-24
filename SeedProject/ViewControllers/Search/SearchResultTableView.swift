//
//  SearchHistoryTableViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/15.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit

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
        }
    }

}
