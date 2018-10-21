//
//  ServiceTypeSelectionViewModel.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

protocol ServiceTypeSelectionViewModelDelegate: class {
    func loadContent()
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func getModel(forIndex index: Int) -> ServiceType
    func getColor(forIndex index : Int) -> UIColor
}

class ServiceTypeSelectionViewModel: ServiceTypeSelectionViewModelDelegate {
    
    var view: ServiceTypeSelectionPresentable?
    var typesList = [ServiceType]()
    var provider: ServiceTypeDataAccess?
    var colors = [UIColor]()
    
    init(view: ServiceTypeSelectionPresentable?, provider: ServiceTypeDataAccess = ServiceTypeProvider()) {
        self.view = view
        self.provider = provider
        fillColors()
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
    
    func fillColors() {
        colors.append(UIColor(red: 186/255, green: 21/255, blue: 245/255, alpha: 1.0))
        colors.append(UIColor(red: 220/255, green: 48/255, blue: 141/255, alpha: 1.0))
        colors.append(UIColor(red: 255/255, green: 104/255, blue: 55/255, alpha: 1.0))
        colors.append(UIColor(red: 255/255, green: 144/255, blue: 34/255, alpha: 1.0))
    }
    
    func getColor(forIndex index : Int) -> UIColor {
        return colors[index]
    }
    
}
