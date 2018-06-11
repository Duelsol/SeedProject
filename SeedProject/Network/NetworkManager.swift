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

    func request(baseURL: String = BASE_URL, path: String, method: HTTPMethod = .get, params: [String: Any]? = nil, completion: @escaping (Any) -> ()) {
        Alamofire.request(baseURL + path, method: method, parameters: params)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let code = json["code"].numberValue
                    print(code)
                    if code != 20000 {
                        // code为非"20000"时都表示发生错误
                    } else {
                        completion(json["data"])
                    }
                case .failure(_):
                    let hud = MBProgressHUD.showAdded(to: (UIApplication.shared.keyWindow?.rootViewController?.view)!, animated: true)
                    hud.mode = .text
                    hud.label.text = "无法连接到网络，请稍后重试。"
                    hud.label.textColor = .white
                    hud.bezelView.backgroundColor = .black
                    hud.hide(animated: true, afterDelay: 2)
                }
        }
    }

}
