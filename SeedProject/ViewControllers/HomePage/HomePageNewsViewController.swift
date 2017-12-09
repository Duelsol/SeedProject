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
        return IndicatorInfo(title: NSLocalizedString("homePage.news.title", comment: ""))
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DefaultData.newsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        cell.textLabel?.text = DefaultData.newsContent[indexPath.row]
        return cell
    }

    @objc func loadNewData() {
        let count = DefaultData.newsCount
        for i in count + 1 ... count + DefaultData.newsNextGrowingCount {
            DefaultData.newsCount = DefaultData.newsCount + 1
            DefaultData.newsContent.insert("内容\(i)", at: 0)
        }
        newsTableView.reloadData()
        newsTableView.mj_header.endRefreshing()
    }

    @objc func loadMoreData() {
        let count = DefaultData.newsCount
        for i in count + 1 ... count + DefaultData.newsNextGrowingCount {
            DefaultData.newsCount = DefaultData.newsCount + 1
            DefaultData.newsContent.append("内容\(i)")
        }
        newsTableView.reloadData()
        newsTableView.mj_footer.endRefreshing()
    }

}
