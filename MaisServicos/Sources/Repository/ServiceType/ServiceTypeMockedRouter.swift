//
//  ServiceTypeRouter.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire

enum ServiceTypeRouter: CustomRouter {
    
    
    case getServicesTypes()
    
    /**
     * Path according to route */
    var path: String {
        switch self {
        case .getServicesTypes:
            return URLS.ServiceType.typesList
        }
    }
    
    /**
     * HTTP method according to route */
    var method: HTTPMethod {
        switch self {
        case .getServicesTypes:
            return .get
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        return try baseURLRequest()
    }
    
}
