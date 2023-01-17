//
//  TestViewModel.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import Foundation

class TestViewModel {
    private let service = TestService()
    
    @Published var userList = [TestModel]()
    
    func getUserList() {
        service.getUserList { [weak self] result in
            switch result {
            case .success(let success):
                print("ViewModel Success")
                self?.userList = success
            case .failure(let failure):
                print("ViewModel Fail", failure.localizedDescription)
            }
        }
    }
}
