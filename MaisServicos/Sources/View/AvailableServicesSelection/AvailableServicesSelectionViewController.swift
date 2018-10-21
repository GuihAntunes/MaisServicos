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
    @IBOutlet weak var summaryValue: UILabel?
    @IBOutlet weak var confirmButton: UIButton?
    
    lazy var viewModel: AvailableServicesSelectionViewModelDelegate = AvailableServicesSelectionViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        viewModel.loadContent()
    }
    
    func setupController() {
        servicesTableView?.delegate = self
        servicesTableView?.dataSource = self
        summaryValue?.text = "Total: R$ 0.00"
        confirmButton?.clipsToBounds = true
        confirmButton?.layer.cornerRadius = 0.2 * (confirmButton?.bounds.size.width ?? CGFloat(0))
    }
    
    @IBAction func categoryChanged(_ sender: UISegmentedControl) {
        viewModel.setCurrentCategory(forIndex: sender.selectedSegmentIndex)
        guard let allCells = servicesTableView?.visibleCells as? [AvailableServiceTableViewCell] else { return }
        allCells.forEach({ $0.shouldSelectCell(false) })
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        performSegue(withIdentifier: "SummarySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SummaryViewController {
            destination.setDraft(viewModel.draft)
        }
    }
    
}
