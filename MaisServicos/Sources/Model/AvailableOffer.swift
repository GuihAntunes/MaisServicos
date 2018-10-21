//
//  AvailableOffer.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Foundation

struct AvailableOffer: Codable, Equatable {
    
    var id: Int?
    var name: String?
    var price: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
    }
    
    static func ==(lhs: AvailableOffer, rhs: AvailableOffer) -> Bool {
        return lhs.id == rhs.id
    }
    
}
