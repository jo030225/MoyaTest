//
//  TestViewController.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import UIKit
import RxSwift
import RxCocoa

class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = TestViewModel(useCase: DefaultTestUseCase(repository: TestRepository()))
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
}

extension TestViewController {
    func bindViewModel() {
        print("bindViewModel")
        let input = TestViewModel.Input(
            viewDidLoadEvent: Observable.just(()))
        let output = viewModel.transform(from: input, disposeBag: disposeBag)
        configureViewModelOutput(output)
    }
    
    func configureViewModelOutput(_ output: TestViewModel.Output?) {
        output?.model
            .bind(to: tableView.rx.items(cellIdentifier: "TestTableViewCell", cellType: TestTableViewCell.self)) { row, item, cell in
                cell.bodyLabel.text = item.body
                cell.titleLabel.text = item.title
            }
            .disposed(by: disposeBag)
    }
}

