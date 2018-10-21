//
//  AvailableServicesSelectionViewController+List.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

extension AvailableServicesSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : AvailableServiceTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        fillCellForModel(cell: cell, index: indexPath.row)
        
        return cell
    }
    
    func fillCellForModel(cell : AvailableServiceTableViewCell, index : Int) {
        switch viewModel.currentCategory {
        case .internet:
            cell.fill(withInternetModel: viewModel.getModelServiceForInternet(forIndex: index))
        case .phone:
            cell.fill(withPhoneModel: viewModel.getModelServiceForPhone(forIndex: index))
        case .tv:
            cell.fill(withTVModel: viewModel.getModelServiceForTV(forIndex: index))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
