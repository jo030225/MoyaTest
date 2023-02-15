//
//  DefaultTestUseCase.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/02/14.
//

import Foundation
import RxSwift

final class DefaultTestUseCase: TestUseCase {
    
    
    private let repository: TestRepository
    private var disposeBag = DisposeBag()
    
    var testModel = PublishSubject<[TestModel]>()
    
    init(repository: TestRepository) {
        self.repository = repository
    }
    
    func getUserList() {
        repository.getUserList()
            .subscribe(onNext: { [weak self] entity in
                let model = self!.modelConvert(entity: entity)
                self?.testModel.onNext(model)
            })
            .disposed(by: disposeBag)
    }
    
    private func modelConvert(entity: [TestEntity]) -> [TestModel] {
        let model = entity.map { TestModel(title: $0.title ?? "", body: $0.body ?? "") }
        return model
    }
}
