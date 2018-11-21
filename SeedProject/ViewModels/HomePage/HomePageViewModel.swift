//
//  NewsViewModel.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/11/21.
//  Copyright © 2018 冯奕骅. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomePageViewModel {

    static let shared = HomePageViewModel()

    private init() {}

    let newsNextGrowingCount = 10

    var news: [String] = {
        var result = [String]()
        for i in 1 ... 20 {
            result.append("新闻\(i)")
        }
        return result
    }()

    func fetchNews(completion: @escaping () -> ()) {
        NetworkManager.shared.fetchNews(success: { data in
            for (_, subJson): (String, JSON) in data["items"] {
                self.news.insert(subJson["title"].stringValue, at: 0)
            }
        }, finally: completion)
    }

    func moreNews(completion: () -> ()) {
        let count = news.count
        for i in count + 1 ... count + newsNextGrowingCount {
            news.append("新闻\(i)")
        }
        completion()
    }

}
