//
//  CurrencyViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//Fixer.io

import UIKit

final class CurrencyViewController: UIViewController {
    
    // MARK: Properties
    private var profile: CurrencyView = CurrencyView()
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(choodeSymbolNavigationButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemTeal
        self.view = profile
    }
    
    // MARK: Selectors
    @objc func choodeSymbolNavigationButtonTapped() {
        let viewSymbolsTable = SymbolsTableViewController()
        self.navigationController?.pushViewController(viewSymbolsTable, animated: true)
    }
    
    
    
}
