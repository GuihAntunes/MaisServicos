//
//  ServiceTypeSelectionViewModel.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

protocol ServiceTypeSelectionViewModelDelegate: class {
    func loadContent()
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func getModel(forIndex index: Int) -> ServiceType
}

class ServiceTypeSelectionViewModel: ServiceTypeSelectionViewModelDelegate {
    
    var view: ServiceTypeSelectionPresentable?
    var typesList = [ServiceType]()
    var provider: ServiceTypeDataAccess?
    
    init(view: ServiceTypeSelectionPresentable?, provider: ServiceTypeDataAccess = ServiceTypeProvider()) {
        self.view = view
        self.provider = provider
    }
    
    func loadContent() {
        provider?.getServiceTypeList().then({ [weak self] (list) in
            guard let _self = self else {
                return
            }
            
            _self.typesList = list
            _self.view?.reloadData()
        }).catch({ (error) in
            //present error
        })
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return typesList.count
    }
    
    func getModel(forIndex index: Int) -> ServiceType {
        return typesList[index]
    }
    
}
