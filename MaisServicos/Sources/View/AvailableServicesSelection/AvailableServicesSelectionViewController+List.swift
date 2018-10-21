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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AvailableServiceTableViewCell, let allCells = tableView.visibleCells as? [AvailableServiceTableViewCell] else { return }
        allCells.forEach({ $0.shouldSelectCell(false) })
        cell.shouldSelectCell(true)
        switch viewModel.currentCategory {
        case .internet:
            viewModel.draft.internetService = cell.availableServiceLabel?.text
            viewModel.draft.internetPrice = cell.price
        case .phone:
            viewModel.draft.phoneService = cell.availableServiceLabel?.text
            viewModel.draft.phonePrice = cell.price
        case .tv:
            viewModel.draft.tvService = cell.availableServiceLabel?.text
            viewModel.draft.tvPrice = cell.price
        }
        
        let total = viewModel.draft.tvPrice + viewModel.draft.internetPrice + viewModel.draft.phonePrice
        summaryValue?.text = "Total: R$ " + String(format: "%.2f", total)
    }
    
}
