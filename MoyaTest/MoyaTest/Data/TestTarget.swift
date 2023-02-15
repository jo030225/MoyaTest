//
//  TestTarget.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import Foundation
import Moya

enum TestTarget {
    case getUserList
}

extension TestTarget: BaseTargetType {
    var path: String {
        switch self {
        case .getUserList:
            return "/posts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUserList:
            return .requestPlain
        }
    }
}
