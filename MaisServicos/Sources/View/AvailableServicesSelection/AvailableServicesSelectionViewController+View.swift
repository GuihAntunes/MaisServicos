//
//  AvailableServicesSelectionViewController+View.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

protocol AvailableServicesSelectionPresentable: class {
    func reloadData()
    func startLoading()
    func stopLoading()
}

extension AvailableServicesSelectionViewController: AvailableServicesSelectionPresentable {
    func reloadData() {
        DispatchQueue.main.async {
            self.servicesTableView?.reloadData()
        }
    }
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    
}
