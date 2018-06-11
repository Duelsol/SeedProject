//
//  HomePageNewsViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/9/2.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import XLPagerTabStrip
import SnapKit
import MJRefresh
import SwiftyJSON

class HomePageNewsViewController: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var newsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 点击状态栏回到列表顶部，如果一个界面有多个scrollView，要将其他的设为false
        newsTableView.scrollsToTop = true
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.snp.makeConstraints {
            make in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(view.safeAreaInsets)
            } else {
                make.edges.equalTo(view)
            }
        }
        newsTableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        newsTableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: R.string.localizable.homePageNewsTitle())
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DefaultData.news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.homePageNewsCell, for: indexPath)!
        cell.textLabel?.text = DefaultData.news[indexPath.row]
        return cell
    }

    @objc func loadNewData() {
        NetworkManager.shared.fetchNews { data in
            for (_, subJson): (String, JSON) in data["items"] {
                DefaultData.news.insert(subJson["title"].stringValue, at: 0)
            }
            self.newsTableView.reloadData()
            self.newsTableView.mj_header.endRefreshing()
        }
    }

    @objc func loadMoreData() {
        let count = DefaultData.news.count
        for i in count + 1 ... count + DefaultData.newsNextGrowingCount {
            DefaultData.news.append("新闻\(i)")
        }
        newsTableView.reloadData()
        newsTableView.mj_footer.endRefreshing()
    }

}
