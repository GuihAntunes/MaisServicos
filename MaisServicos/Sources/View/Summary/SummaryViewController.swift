//
//  SummaryViewController.swift
//  MaisServicos
//
//  Created by Guilherme Antunes on 21/10/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import UIKit

class SummaryViewController: UITableViewController {

    @IBOutlet weak var internetLabel: UILabel?
    @IBOutlet weak var phoneLabel: UILabel?
    @IBOutlet weak var tvLabel: UILabel?
    @IBOutlet weak var totalsLabel: UILabel?
    
    private var draft = ServicesSubscriptionDraft()
    
    func setDraft(_ draft : ServicesSubscriptionDraft) {
        self.draft = draft
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLabels()
    }
    
    func setupLabels() {
        internetLabel?.text = draft.internetService
        phoneLabel?.text = draft.phoneService
        tvLabel?.text = draft.tvService
        let total = draft.tvPrice + draft.internetPrice + draft.phonePrice + 30
        totalsLabel?.text = "R$ " + String(format: "%.2f", total)
    }
    @IBAction func confirmAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Parabéns!", message: "Você acabou de solicitar um combo para sua casa! Em breve você receberá uma confirmação do pedido!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
