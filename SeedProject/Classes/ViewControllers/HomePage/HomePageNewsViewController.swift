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

class HomePageNewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!

    var homePageViewModel = HomePageViewModel.shared

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

    @objc func loadNewData() {
        homePageViewModel.fetchNews {
            self.newsTableView.reloadData()
            self.newsTableView.mj_header.endRefreshing()
        }
    }

    @objc func loadMoreData() {
        homePageViewModel.moreNews {
            self.newsTableView.reloadData()
            self.newsTableView.mj_footer.endRefreshing()
        }
    }

}

extension HomePageNewsViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: R.string.localizable.homePageNewsTitle())
    }

}

extension HomePageNewsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePageViewModel.news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.homePageNewsCell, for: indexPath)!
        cell.textLabel?.text = homePageViewModel.news[indexPath.row]
        return cell
    }

}
