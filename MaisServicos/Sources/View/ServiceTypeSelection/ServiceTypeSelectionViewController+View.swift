//
//  ServiceTypeSelectionViewController+View.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

protocol ServiceTypeSelectionPresentable: class {
    func reloadData()
    func startLoading()
    func stopLoading()
}

extension ServiceTypeSelectionViewController: ServiceTypeSelectionPresentable {
    func reloadData() {
        DispatchQueue.main.async {
            self.serviceTypeTableView?.reloadData()
        }
    }
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
}
