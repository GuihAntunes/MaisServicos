//
//  AvailableService.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

struct AvailableService: Codable {
    
    var connectionSpeed : String?
    var offers: [AvailableOffer]?
    
    enum CodingKeys: String, CodingKey {
        case connectionSpeed
        case offers
    }
    
}


