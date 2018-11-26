//
//  LoadingView.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/11/26.
//  Copyright © 2018 冯奕骅. All rights reserved.
//

import Foundation

class LoadingView: UIView {
}

extension UIView {

    func showLoading() {
        let loadingView = LoadingView(frame: frame)
        loadingView.backgroundColor = UIColor.white
        let label = UILabel(frame: frame)
        label.text = "加载中..."
        label.sizeToFit()
        label.center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        loadingView.addSubview(label)
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
