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
    
    var price : Double = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        serviceChosenImage?.isHidden = true
        selectionStyle = .none
    }
    
    func fill(withInternetModel model : AvailableServiceForInternet) {
        guard let name = model.connectionSpeed, let price = model.offers?.first?.price else {
            return
        }
        self.price = price
        availableServiceLabel?.text = "Internet " + name + " - R$ " + String(format: "%.2f", price)
    }
    
    func fill(withPhoneModel model : AvailableServicesForPhone) {
        guard let name = model.name, let price = model.price else {
            return
        }
        availableServiceLabel?.text = "Ligações para telefone " + name + " - R$ " + String(format: "%.2f", Double(price))
    }
    
    func fill(withTVModel model : AvailableServicesForTV) {
        guard let name = model.name, let channels = model.channels, let price = model.price else {
            return
        }
        availableServiceLabel?.text = "TV " +  name + " - " + channels + " - R$ " + String(format: "%.2f", price)
    }
    
    func shouldSelectCell(_ select : Bool) {
        serviceChosenImage?.isHidden = !select
        select ? serviceChosenImage?.image = UIImage(named: "CheckedPurple") ?? UIImage() : nil
    }
    
}
