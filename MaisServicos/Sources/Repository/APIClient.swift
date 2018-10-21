//
//  APIClient.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Alamofire
import Reachability
import Promises

enum CustomError: Error {
    case connectionError(String)
    case mappingError(String)
    case APIError(String)
    case generalError(String)
    case deallocatedClass(String)
}

class APIClient {
    
    let connectionChecker: Reachability?
    let decoder : JSONDecoder
    
    init(connectionChecker : Reachability? = Reachability(), decoder: JSONDecoder = JSONDecoder()) {
        self.connectionChecker = connectionChecker
        self.decoder = decoder
        
    }
    
    func mockedRequest<T: Codable>(model: T.Type, fileName : String) -> Promise<T> {
        return Promise<T> { [weak self] fulfill, reject in
            guard let _self = self, let url = Bundle.main.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url, options: .mappedIfSafe) else {
                reject(CustomError.generalError("Houve um erro ao buscar o arquivo do modelo \(T.self)!"))
                return
            }
            
            guard let model = try? _self.decoder.decode(T.self, from: data) else {
                reject(CustomError.mappingError("Houve um erro ao fazer o parse do modelo \(T.self)!"))
                return
            }
            
            fulfill(model)
        }
    }
    
    func request<T: Codable>(model: T.Type, _ requestConvertible : URLRequestConvertible) -> Promise<T> {
        return Promise<T> { [weak self] fulfill, reject in
            guard let _self = self, let checker = _self.connectionChecker, checker.isConnected else {
                reject(CustomError.connectionError("Por favor, verifique sua conexão com a internet!"))
                return
            }
            
            Alamofire.request(requestConvertible).validate().responseData(completionHandler: { (response) in
                guard let data = response.value else {
                    reject(CustomError.APIError(response.error?.localizedDescription ?? "Ocorreu um erro inesperado, por favor, tente novamente!"))
                    return
                }
                
                guard let model = try? _self.decoder.decode(T.self, from: data) else {
                    reject(CustomError.mappingError("Houve um erro ao fazer o parse do modelo \(T.self)!"))
                    return
                }
                
                fulfill(model)
            })
        }
    }
    
}
