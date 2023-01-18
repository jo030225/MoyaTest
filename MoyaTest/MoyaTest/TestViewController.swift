//
//  TestViewController.swift
//  MoyaTest
//
//  Created by 조주혁 on 2023/01/18.
//

import UIKit
import Combine

class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = TestViewModel()
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
        bindViewModel()
    }
    
    private func layoutSetting() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func bindViewModel() {
        viewModel.getUserList()
        
        viewModel.$userList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
            self?.tableView.reloadData()
        }
        .store(in: &cancellables)
    }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        cell.titleLabel.text = viewModel.userList[indexPath.row].title
        cell.bodyLabel.text = viewModel.userList[indexPath.row].body
        return cell
    }
}
