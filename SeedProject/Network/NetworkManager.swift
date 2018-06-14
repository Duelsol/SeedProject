//
//  NetworkManager.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/10.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MBProgressHUD

struct NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    /// 统一API请求方法
    ///
    /// - Parameters:
    ///   - baseURL: 服务器根路径
    ///   - path: API具体路径
    ///   - method: HTTP方法
    ///   - params: 参数
    ///   - success: 请求成功时的回调，传入的参数是response.data
    ///   - finally: 最终回调
    func request(baseURL: String = BASE_URL, path: String, method: HTTPMethod = .get, params: [String: Any]? = nil, success: @escaping (Any) -> (), finally: (() -> ())? = nil) {
        Alamofire.request(baseURL + path, method: method, parameters: params)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let code = json["code"].numberValue
                    if code != 20000 {
                        // code为非"20000"时都表示业务错误
                    } else {
                        success(json["data"])
                    }
                case .failure(_):
                    guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else {
                        return
                    }
                    let hud = MBProgressHUD.showAdded(to: rootVC.view, animated: true)
                    hud.mode = .text
                    hud.label.text = "无法连接到网络，请稍后重试。"
                    hud.label.textColor = .white
                    hud.bezelView.backgroundColor = .black
                    hud.hide(animated: true, afterDelay: 2)
                }
                finally?()
        }
    }

}
