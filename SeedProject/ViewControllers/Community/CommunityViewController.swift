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
fileprivate let SPACING: CGFloat = 12
fileprivate let TEXT_HEIGHT: CGFloat = 20
fileprivate let ITEM_SIZE: CGSize = {
    // 每一行显示2个
    let width = (SCREEN_WIDTH - SPACING * 3) / 2
    // 黄金比例为0.618，20是文字显示的高度
    let height = width * 0.618 + TEXT_HEIGHT
    return CGSize(width: width, height: height)
}()

class CommunityViewController: UIViewController {

    @IBOutlet weak var communityCollectionView: UICollectionView!

    let titleLabel = UILabel()
    let communityViewModel = CommunityViewModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // 自定义导航栏
        titleLabel.text = R.string.localizable.tabBarCommunityTitle()
        titleLabel.font = UIFont.systemFont(ofSize: NAVIGATIONBAR_TITLE_SIZE)
        let communityNavItem = UINavigationItem()
        communityNavItem.titleView = titleLabel
        let customNavBar = createCustomNavBar(with: communityNavItem, replaceOf: navigationController)
        view.addSubview(customNavBar)

        communityCollectionView.delegate = self
        communityCollectionView.dataSource = self
        communityCollectionView.frame = SafeArea().withNavigationBar().withTabBar().value()
        let layout = communityCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = SPACING
        layout.minimumLineSpacing = SPACING
        layout.itemSize = ITEM_SIZE
        layout.sectionInset = UIEdgeInsets(top: 0, left: SPACING, bottom: SPACING, right: SPACING)
        layout.footerReferenceSize = CGSize(width: SCREEN_WIDTH, height: 8)

        addThemeObserver()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension CommunityViewController: ThemeChangeProtocol {

    override func handleThemeChange() {
        super.handleThemeChange()
        titleLabel.textColor = ThemeManager.shared.getColor(ofElement: .navigationBarText)
    }

}

extension CommunityViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return communityViewModel.data.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return communityViewModel.data[section].first!.value.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: R.reuseIdentifier.communitySectionHeader, for: indexPath)!
            sectionHeader.label.text = communityViewModel.data[indexPath.section].keys.first
            sectionHeader.label.snp.makeConstraints {
                make in
                make.center.equalToSuperview()
            }
            return sectionHeader
        } else if kind == UICollectionView.elementKindSectionFooter {
            let sectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: R.reuseIdentifier.communitySectionFooter.identifier, for: indexPath)
            sectionFooter.backgroundColor = UIColor.flatWhite()
            return sectionFooter
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.communityCell, for: indexPath)!
        cell.imageView.backgroundColor = UIColor.randomFlat()
        cell.imageView.layer.cornerRadius = 8
        cell.imageView.snp.makeConstraints {
            make in
            make.width.equalTo(ITEM_SIZE.width)
            make.height.equalTo(ITEM_SIZE.height - TEXT_HEIGHT)
        }
        cell.label.text = communityViewModel.data[indexPath.section].first!.value[indexPath.row]
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
