//
//  AvailableServicesRouter.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire

enum AvailableServicesRouter: CustomRouter {

    case getAvailableServicesForInternet()
    case getAvailableServicesForPhone()
    case getAvailableServicesForTV()
    
    /**
     * Path according to route */
    var path: String {
        switch self {
        case .getAvailableServicesForInternet:
            return URLS.AvailableServices.servicesListForInternet
        case .getAvailableServicesForPhone:
            return URLS.AvailableServices.servicesListForPhone
        case .getAvailableServicesForTV:
            return URLS.AvailableServices.servicesListForTV
        }
    }
    
    /**
     * HTTP method according to route */
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        return try baseURLRequest()
    }
    
}
