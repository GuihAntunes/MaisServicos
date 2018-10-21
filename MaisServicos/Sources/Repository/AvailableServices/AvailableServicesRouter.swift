//
//  AvailableServicesRouter.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire

enum AvailableServicesRouter: CustomRouter {

    case availableServicesForInternet()
    
    /**
     * Path according to route */
    var path: String {
        switch self {
        case .availableServicesForInternet:
            return URLS.ServiceType.typesList
        }
    }
    
    /**
     * HTTP method according to route */
    var method: HTTPMethod {
        switch self {
        case .availableServicesForInternet:
            return .get
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        return try baseURLRequest()
    }
    
}
