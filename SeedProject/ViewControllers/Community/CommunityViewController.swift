//
//  CommunityViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit
import SnapKit

class CommunityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var communityCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray

        // 自定义导航栏
        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("tabBar.community.title", comment: "")
        titleLabel.font = UIFont.systemFont(ofSize: NAVIGATIONBAR_TITLE_SIZE)
        titleLabel.textColor = NAVIGATIONBAR_TEXT_COLOR
        let homePageNavItem = UINavigationItem()
        homePageNavItem.titleView = titleLabel
        let customNavBar = createCustomNavBar(with: homePageNavItem, replaceOf: navigationController)
        view.addSubview(customNavBar)

        communityCollectionView.delegate = self
        communityCollectionView.dataSource = self
        communityCollectionView.frame = CGRect(x: 0, y: STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - STATUSBAR_HEIGHT - NAVIGATIONBAR_HEIGHT - TABBAR_HEIGHT)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DefaultData.communities.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DefaultData.communities[section].first!.value.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CommunitySectionHeader", for: indexPath) as! CommunityCollectionSectionHeader
            sectionHeader.label.text = DefaultData.communities[indexPath.section].keys.first
            return sectionHeader
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommunityCell", for: indexPath) as! CommunityCollectionViewCell
        cell.imageView.backgroundColor = UIColor.randomFlat()
        cell.label.text = DefaultData.communities[indexPath.section].first!.value[indexPath.row]
        return cell
    }

}
