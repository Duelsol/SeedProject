//
//  CommunityCollectionViewCell.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2017/12/14.
//  Copyright © 2017年 冯奕骅. All rights reserved.
//

import UIKit
import SnapKit

class CommunityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.snp.makeConstraints {
            make in
            // 黄金比例为0.618
            make.width.equalTo(168)
            make.height.equalTo(104)
        }
    }

}
