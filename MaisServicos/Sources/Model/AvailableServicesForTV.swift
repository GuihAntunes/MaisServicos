//
//  AvailableServicesForTV.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

struct AvailableServicesForTV: Codable {
    
    var id: Int?
    var name : String?
    var price: Double?
    var channels: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case channels
    }
    
}
