//
//  ServiceTypeTableViewCell.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

class ServiceTypeTableViewCell: UITableViewCell, Identifiable {

    @IBOutlet weak var serviceTypeImage: UIImageView?
    @IBOutlet weak var serviceTypeLabel: UILabel?
    
    func fill(withModel model : ServiceType) {
        guard let imageName = model.imageName, let image = UIImage(named: imageName), let serviceTypeName = model.name else {
            return
        }
        serviceTypeImage?.image = image
        serviceTypeLabel?.text = serviceTypeName
    }
    
}
