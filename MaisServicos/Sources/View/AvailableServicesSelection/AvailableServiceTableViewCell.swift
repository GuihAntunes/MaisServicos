//
//  AvailableServiceTableViewCell.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

class AvailableServiceTableViewCell: UITableViewCell, Identifiable {

    @IBOutlet weak var availableServiceLabel: UILabel?
    @IBOutlet weak var serviceChosenImage: UIImageView?
    
    func fill(withInternetModel model : AvailableServiceForInternet) {
        guard let name = model.connectionSpeed else {
            return
        }
        availableServiceLabel?.text = name
    }
    
    func fill(withPhoneModel model : AvailableServicesForPhone) {
        guard let name = model.name, let price = model.price else {
            return
        }
        availableServiceLabel?.text = name + " - R$ " + String(describing: price)
    }
    
    func fill(withTVModel model : AvailableServicesForTV) {
        guard let name = model.name, let channels = model.channels, let price = model.price else {
            return
        }
        availableServiceLabel?.text = name + " - " + channels + " - R$ " + String(describing: price)
    }
    
}
