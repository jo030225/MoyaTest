//
//  Networkable.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import Foundation
import Moya

protocol Networkable {
    /// provider객체 생성 시 Moya에서 제공하는 TargetType을 명시해야 하므로 타입 필요
    associatedtype Target: TargetType
    /// DIP를 위해 protocol에 provider객체를 만드는 함수 정의
    func makeProvider() -> NetworkManager<Target>
}

extension Networkable {

    func makeProvider() -> NetworkManager<Target> {
        
      /// plugin객체를 주입하여 provider 객체 생성
        return NetworkManager<Target>(plugins: [NetworkLoggerPlugin()])
    }

}
