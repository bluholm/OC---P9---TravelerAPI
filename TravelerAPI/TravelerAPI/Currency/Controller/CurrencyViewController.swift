//
//  CurrencyViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//Fixer.io

import UIKit

class CurrencyViewController: UIViewController {
    
    // MARK: Properties
    var profile: CurrencyView = CurrencyView()
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(chooseSymbolsButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemTeal
        self.view = profile
    }
    
    // MARK: Selectors
    @objc func chooseSymbolsButtonTapped() {
        let viewSymbolsTable = SymbolsTableViewController()
        navigationController?.pushViewController(viewSymbolsTable, animated: true)
    }
    
    
    
}
