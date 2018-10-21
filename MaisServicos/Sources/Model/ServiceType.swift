//
//  ServiceType.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

struct ServiceType: Codable, Equatable {
    
    var id: Int?
    var name: String?
    var imageName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageName
    }
    
    static func ==(lhs: ServiceType, rhs: ServiceType) -> Bool {
        return lhs.id == rhs.id
    }
    
}
