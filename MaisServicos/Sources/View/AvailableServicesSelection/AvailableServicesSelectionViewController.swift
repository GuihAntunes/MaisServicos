//
//  AvailableServicesSelectionViewController.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

class AvailableServicesSelectionViewController: UIViewController {

    @IBOutlet weak var servicesTableView: UITableView?
    @IBOutlet weak var servicesSegmentedControl: UISegmentedControl?
    
    lazy var viewModel: AvailableServicesSelectionViewModelDelegate = AvailableServicesSelectionViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        viewModel.loadContent()
    }
    
    func setupController() {
        servicesTableView?.delegate = self
        servicesTableView?.dataSource = self
    }
    
    @IBAction func categoryChanged(_ sender: UISegmentedControl) {
        viewModel.setCurrentCategory(forIndex: sender.selectedSegmentIndex)
    }
    
    
}
