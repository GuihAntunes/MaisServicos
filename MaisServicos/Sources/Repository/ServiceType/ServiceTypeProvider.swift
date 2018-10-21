//
//  ServiceTypeProvider.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Promises

protocol ServiceTypeDataAccess: class {
    func getServiceTypeList() -> Promise<[ServiceType]>
}

class ServiceTypeProvider: ServiceTypeDataAccess {
    
    let client: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.client = apiClient
    }
    
    func getServiceTypeList() -> Promise<[ServiceType]> {
        return Promise<[ServiceType]> { [weak self] fulfill, reject in
            guard let _self = self else {
                reject(CustomError.deallocatedClass("Classe dealocada!"))
                return
            }
            
            _self.client.request(model: [ServiceType].self, ServiceTypeRouter.getServicesTypes()).then({ (list) in
                fulfill(list)
            }).catch({ (error) in
                reject(error)
            })
        }
    }
    
}
