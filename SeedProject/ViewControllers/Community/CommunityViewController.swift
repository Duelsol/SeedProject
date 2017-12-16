//
//  CommunityViewController.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/11/11.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit
import SnapKit

// 固定间距
fileprivate let SPACING: CGFloat = 26
fileprivate let TEXT_HEIGHT: CGFloat = 20
fileprivate let ITEM_SIZE: CGSize = {
    // 每一行显示2个
    let width = (SCREEN_WIDTH - SPACING * 3) / 2
    // 黄金比例为0.618，20是文字显示的高度
    let height = width * 0.618 + TEXT_HEIGHT
    return CGSize(width: width, height: height)
}()

class CommunityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var communityCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

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
        communityCollectionView.frame = SAFE_AREA
        let layout = communityCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = SPACING
        layout.minimumLineSpacing = SPACING
        layout.itemSize = ITEM_SIZE
        layout.sectionInset = UIEdgeInsets(top: 0, left: SPACING, bottom: SPACING, right: SPACING)
        layout.footerReferenceSize = CGSize(width: SCREEN_WIDTH, height: 8)
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
            sectionHeader.label.snp.makeConstraints {
                make in
                make.center.equalToSuperview()
            }
            return sectionHeader
        } else if kind == UICollectionElementKindSectionFooter {
            let sectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CommunitySectionFooter", for: indexPath)
            sectionFooter.backgroundColor = UIColor.flatWhite()
            return sectionFooter
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommunityCell", for: indexPath) as! CommunityCollectionViewCell
        cell.imageView.backgroundColor = UIColor.randomFlat()
        cell.imageView.layer.cornerRadius = 8
        cell.imageView.snp.makeConstraints {
            make in
            make.width.equalTo(ITEM_SIZE.width)
            make.height.equalTo(ITEM_SIZE.height - TEXT_HEIGHT)
        }
        cell.label.text = DefaultData.communities[indexPath.section].first!.value[indexPath.row]
        cell.label.snp.makeConstraints {
            make in
            make.leading.equalTo(cell.imageView)
            make.bottom.equalTo(cell.imageView).offset(TEXT_HEIGHT)
        }
        return cell
    }

}

class CommunityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

}

class CommunityCollectionSectionHeader: UICollectionReusableView {

    @IBOutlet weak var label: UILabel!

}
