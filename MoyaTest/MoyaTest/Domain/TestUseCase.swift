//
//  TestUseCase.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/02/14.
//

import Foundation
import RxSwift

protocol TestUseCase {
    var testModel: PublishSubject<[TestModel]> { get set }
    func getUserList()
}
