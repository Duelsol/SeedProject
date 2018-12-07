//
//  NetworkNotReachableView.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/12/6.
//  Copyright © 2018 冯奕骅. All rights reserved.
//

import Foundation
import SnapKit

class NetworkNotReachableView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
        let label = UILabel()
        label.text = "无法访问网络"
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

    func showNetworkNotReachable(frame: CGRect? = nil) {
        let finalFrame = frame ?? self.bounds
        let networkNotReachableView = NetworkNotReachableView(frame: finalFrame)
        addSubview(networkNotReachableView)
        bringSubviewToFront(networkNotReachableView)
    }

    func hideNetworkNotReachable() {
        for subView in subviews {
            if subView is NetworkNotReachableView {
                subView.removeFromSuperview()
                break
            }
        }
    }

}
