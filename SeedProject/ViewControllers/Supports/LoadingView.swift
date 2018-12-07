//
//  LoadingView.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/11/26.
//  Copyright © 2018 冯奕骅. All rights reserved.
//

import Foundation
import SnapKit

class LoadingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
        let label = UILabel()
        label.text = "加载中..."
        label.sizeToFit()
        addSubview(label)
        label.snp.makeConstraints {
            make in
            make.center.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UIView {

    func showLoading(frame: CGRect? = nil) {
        let finalFrame = frame ?? self.bounds
        let loadingView = LoadingView(frame: finalFrame)
        addSubview(loadingView)
        bringSubviewToFront(loadingView)
    }

    func hideLoading() {
        for subView in subviews {
            if subView is LoadingView {
                subView.removeFromSuperview()
                break
            }
        }
    }

}
