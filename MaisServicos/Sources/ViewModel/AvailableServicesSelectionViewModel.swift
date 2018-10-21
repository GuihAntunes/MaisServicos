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
    func getModelServiceForInternet(forIndex index: Int) -> AvailableServiceForInternet
    func getModelServiceForPhone(forIndex index: Int) -> AvailableServicesForPhone
    func getModelServiceForTV(forIndex index: Int) -> AvailableServicesForTV
    var currentCategory: AvailableServicesCategory { get }
    func setCurrentCategory(forIndex index : Int)
}

enum AvailableServicesCategory {
    case internet
    case phone
    case tv
}

class AvailableServicesSelectionViewModel: AvailableServicesSelectionViewModelDelegate {
    
    var view: AvailableServicesSelectionPresentable?
    var availableInternetServices = [AvailableServiceForInternet]()
    var availablePhoneServices = [AvailableServicesForPhone]()
    var availableTVServices = [AvailableServicesForTV]()
    var provider: AvailableServicesDataAccess?
    var currentCategory: AvailableServicesCategory = .internet {
        didSet {
            loadContent()
        }
    }
    
    
    
    init(view: AvailableServicesSelectionPresentable?, provider: AvailableServicesDataAccess = AvailableServicesProvider()) {
        self.view = view
        self.provider = provider
    }
    
    func loadContent() {
        switch currentCategory {
        case .internet:
            loadInternetServices()
        case .phone:
            loadPhoneServices()
        case .tv:
            loadTVServices()
        }
    }
    
    func setCurrentCategory(forIndex index : Int) {
        switch index {
        case 0:
            currentCategory = .internet
        case 1:
            currentCategory = .phone
        case 2:
            currentCategory = .tv
        default:
            currentCategory = .internet
        }
    }
    
    func loadInternetServices() {
        provider?.getAvailableServicesForInternet().then({ [weak self] (serviceList) in
            guard let _self = self else {
                return
            }
            
            _self.availableInternetServices = serviceList
            _self.view?.reloadData()
        })
    }
    
    func loadPhoneServices() {
        provider?.getAvailableServicesForPhone().then({ [weak self] (serviceList) in
            guard let _self = self else {
                return
            }
            
            _self.availablePhoneServices = serviceList
            _self.view?.reloadData()
        })
    }
    
    func loadTVServices() {
        provider?.getAvailableServicesForTV().then({ [weak self] (serviceList) in
            guard let _self = self else {
                return
            }
            
            _self.availableTVServices = serviceList
            _self.view?.reloadData()
        })
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
        switch currentCategory {
        case .internet:
            return availableInternetServices.count
        case .phone:
            return availablePhoneServices.count
        case .tv:
            return availableTVServices.count
        }
    }
    
    func getModelServiceForInternet(forIndex index: Int) -> AvailableServiceForInternet {
        return availableInternetServices[index]
    }
    
    func getModelServiceForPhone(forIndex index: Int) -> AvailableServicesForPhone {
        return availablePhoneServices[index]
    }
    
    func getModelServiceForTV(forIndex index: Int) -> AvailableServicesForTV {
        return availableTVServices[index]
    }
    
    
}
