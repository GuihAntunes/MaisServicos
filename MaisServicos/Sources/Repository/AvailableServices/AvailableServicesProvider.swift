//
//  AvailableServicesProvider.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises

protocol AvailableServicesDataAccess: class {
    func getAvailableServicesForInternet() -> Promise<[AvailableServiceForInternet]>
    func getAvailableServicesForPhone() -> Promise<[AvailableServicesForPhone]>
    func getAvailableServicesForTV() -> Promise<[AvailableServicesForTV]>
}

class AvailableServicesProvider: AvailableServicesDataAccess {
    
    let client: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.client = apiClient
    }
    
    func getAvailableServicesForInternet() -> Promise<[AvailableServiceForInternet]> {
        return Promise<[AvailableServiceForInternet]> { [weak self] fulfill, reject in
            guard let _self = self else {
                reject(CustomError.deallocatedClass("Classe dealocada!"))
                return
            }
            
            _self.client.request(model: [AvailableServiceForInternet].self, AvailableServicesRouter.getAvailableServicesForInternet()).then({ (list) in
                fulfill(list)
            }).catch({ (error) in
                reject(error)
            })
        }

    }
    
    func getAvailableServicesForPhone() -> Promise<[AvailableServicesForPhone]> {
        return Promise<[AvailableServicesForPhone]> {
            [weak self] fulfill, reject in
            guard let _self = self else {
                reject(CustomError.deallocatedClass("Classe dealocada!"))
                return
            }
            
            _self.client.request(model: [AvailableServicesForPhone].self, AvailableServicesRouter.getAvailableServicesForPhone()).then({ (list) in
                fulfill(list)
            }).catch({ (error) in
                reject(error)
            })
        }
    }
    
    func getAvailableServicesForTV() -> Promise<[AvailableServicesForTV]> {
        return Promise<[AvailableServicesForTV]> {
            [weak self] fulfill, reject in
            guard let _self = self else {
                reject(CustomError.deallocatedClass("Classe dealocada!"))
                return
            }
            
            _self.client.request(model: [AvailableServicesForTV].self, AvailableServicesRouter.getAvailableServicesForTV()).then({ (list) in
                fulfill(list)
            }).catch({ (error) in
                reject(error)
            })
        }
    }
    
}
