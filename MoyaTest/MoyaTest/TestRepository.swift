//
//  TestRepository.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import Foundation
import Moya

class TestRepository: Networkable {
    typealias Target = TestAPI
    
    func getUserList(completion: @escaping (Result<[TestEntity], MoyaError>) -> Void) {
        makeProvider().requestResult(target: .getUserList, model: [TestEntity].self) { result in
            switch result {
            case .success(let success):
                print("Repository Success")
                completion(.success(success))
            case .failure(let failure):
                print("Repository Fail", failure.localizedDescription)
                completion(.failure(failure))
            }
        }
    }
}
