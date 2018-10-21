//
//  AvailableServicesProvider.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises

protocol AvailableServicesDataAccess: class {
    func getAvailableServices() -> Promise<[AvailableService]>
}

class AvailableServicesProvider: AvailableServicesDataAccess {
    let client: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.client = apiClient
    }
    
    func getAvailableServices() -> Promise<[AvailableService]> {
        return Promise<[AvailableService]> { [weak self] fulfill, reject in
            guard let _self = self else {
                reject(CustomError.deallocatedClass("Classe dealocada!"))
                return
            }
            
            _self.client.request(model: [AvailableService].self, ServiceTypeRouter.getServicesTypes()).then({ (list) in
                fulfill(list)
            }).catch({ (error) in
                reject(error)
            })
        }
    }
}
