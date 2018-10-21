//
//  ServiceTypeSelectionViewController.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

class ServiceTypeSelectionViewController: UIViewController {

    lazy var viewModel: ServiceTypeSelectionViewModelDelegate = ServiceTypeSelectionViewModel(view: self)
    
    @IBOutlet weak var serviceTypeTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        viewModel.loadContent()
    }
    
    func setupController() {
        serviceTypeTableView?.dataSource = self
        serviceTypeTableView?.delegate = self
    }

}
