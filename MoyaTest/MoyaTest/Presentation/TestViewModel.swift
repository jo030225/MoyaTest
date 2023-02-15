//
//  TestViewModel.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import Foundation
import RxSwift
import RxCocoa

final class TestViewModel {
    private let useCase: TestUseCase
    
    struct Input {
        let viewDidLoadEvent: Observable<Void>
    }
    
    struct Output {
        var model = PublishRelay<[TestModel]>()
    }
    
    init(useCase: TestUseCase) {
        self.useCase = useCase
    }
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        print("transform")
        self.configureInput(input, disposeBag: disposeBag)
        return createOutput(from: input, disposeBag: disposeBag)
    }
    
    private func configureInput(_ input: Input, disposeBag: DisposeBag) {
        input.viewDidLoadEvent
            .subscribe(onNext: { [weak self] in
                print("getUserList")
                self?.useCase.getUserList()
            })
            .disposed(by: disposeBag)
    }
    
    private func createOutput(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        useCase.testModel
            .bind(to: output.model)
            .disposed(by: disposeBag)
        
        
        
        return output
    }
    
}
