//
//  TestRepository.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import Foundation
import Moya
import RxSwift

class TestRepository: Networkable {
    typealias Target = TestTarget
    
    func getUserList() -> Observable<[TestEntity]> {
        return Observable<[TestEntity]>.create { [weak self] observer in
            self?.makeProvider().requestResult(target: .getUserList, model: [TestEntity].self) { result in
                switch result {
                case .success(let success):
                    print("Repository Success")
                    observer.onNext(success)
                    observer.onCompleted()
                case .failure(let failure):
                    print("Repository Fail", failure.localizedDescription)
                    observer.onError(failure)
                }
            }
            return Disposables.create()
        }
    }
}
