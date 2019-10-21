//
//  NetworkNotReachableView.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/12/6.
//  Copyright © 2018 冯奕骅. All rights reserved.
//

import Foundation
import SnapKit
import MBProgressHUD

class NetworkNotReachableView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.white
        let label = UILabel()
        label.text = "无法连接到网络，请稍后重试。"
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

protocol NetworkNotReachableProtocol where Self: UIViewController {}

extension NetworkNotReachableProtocol {

    func addNetworkNotReachableObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNetworkNotReachable), name: CustomNotification.networkNotReachable.notificationName, object: nil)
    }

    func showNetworkNotReachableView(frame: CGRect? = nil) {
        let finalFrame = frame ?? view.bounds
        let networkNotReachableView = NetworkNotReachableView(frame: finalFrame)
        view.addSubview(networkNotReachableView)
        view.bringSubviewToFront(networkNotReachableView)
    }

    func hideNetworkNotReachableView() {
        for subView in view.subviews {
            if subView is NetworkNotReachableView {
                subView.removeFromSuperview()
                break
            }
        }
    }

    func showNetworkNotReachableAlert() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = "无法连接到网络，请稍后重试。"
        hud.label.textColor = .white
        hud.bezelView.backgroundColor = .black
        hud.hide(animated: true, afterDelay: 2)
    }

}

extension UIViewController {

    @objc func handleNetworkNotReachable() {}

}
