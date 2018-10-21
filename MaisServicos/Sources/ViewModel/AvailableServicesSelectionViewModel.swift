//
//  AvailableServicesSelectionViewModel.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

protocol AvailableServicesSelectionViewModelDelegate: class {
    func loadContent()
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func getModel(forIndex index: Int) -> AvailableService
}

enum AvailableServicesCategory {
    case internet
    case phone
    case tv
}

class AvailableServicesSelectionViewModel: AvailableServicesSelectionViewModelDelegate {
    
    var view: AvailableServicesSelectionPresentable?
    var availableInternetServices = [AvailableService]()
    var availablePhoneServices = [AvailableService]()
    var availableTVServices = [AvailableService]()
    var provider: AvailableServicesDataAccess?
    var currentCategory: AvailableServicesCategory = .internet
    
    init(view: AvailableServicesSelectionPresentable?, provider: AvailableServicesDataAccess = AvailableServicesProvider()) {
        self.view = view
        self.provider = provider
    }
    
    func loadContent() {
        
    }
    
    func numberOfSections() -> Int {
        switch currentCategory {
        case .internet:
            return getSectionsForInternet()
        default:
            return 1
        }
    }
    
    func getSectionsForInternet() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return 0
    }
    
    func getModel(forIndex index: Int) -> AvailableService {
        return AvailableService()
    }
    
    
}
