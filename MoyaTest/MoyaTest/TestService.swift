//
//  TestService.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import Foundation
import Moya

class TestService {
    
    private let repository = TestRepository()
    
    func getUserList(completion: @escaping (Result<[TestModel], MoyaError>) -> Void) {
        repository.getUserList { result in
            switch result {
            case .success(let success):
                let model = success.map { TestModel(title: $0.title ?? "", body: $0.body ?? "") }
                print("Service Success")
                completion(.success(model))
            case .failure(let failure):
                print("Service Fail", failure.localizedDescription)
                completion(.failure(failure))
            }
        }
    }
}
