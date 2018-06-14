//
//  HomePageNetwork.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/10.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation
import SwiftyJSON

extension NetworkManager {

    func fetchNews(success: @escaping (JSON) -> (), finally: @escaping () -> ()) {
        request(path: "/table/list", success: { data in
            success(data as! JSON)
        }, finally: {
            finally()
        })
    }

}
