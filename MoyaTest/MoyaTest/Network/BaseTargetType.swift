//
//  BaseTargetType.swift
//  HaruEpisode
//
//  Created by 조주혁 on 2023/01/17.
//

import Moya
import UIKit

protocol BaseTargetType: TargetType {
}

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }

    var headers: [String: String]? {
        let header = ["Content-type": "application/json"]
        return header
    }

    var sampleData: Data {
        return Data()
    }

}
