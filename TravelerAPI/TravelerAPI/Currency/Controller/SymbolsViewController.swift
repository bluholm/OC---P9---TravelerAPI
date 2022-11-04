//
//  SymbolsViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-02.
//

import UIKit

final class SymbolsTableViewController: UITableViewController {

    // MARK: Properties
    private var listOfSymbols = [String]()
    private let currencyService = CurrencyService()
    let identifierCell = "symbolCell"
    private let profile: SymbolView = SymbolView()
    private let titleTableView = "Choose Currency"
    
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = titleTableView
        profile.dataSource = self
        profile.delegate = self
        profile.loadTableView()
        
        self.view = profile
        
        self.getCurrency()
    }
    
    // - MARK: Delegate and DataSource UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfSymbols.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profile.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        cell.textLabel?.text = listOfSymbols[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CurrencyViewController().choosenCurrency = listOfSymbols[indexPath.row]
        return
    }
    
    // -MARK: Privates Customs Functions
    private func  getCurrency() {
        currencyService.getCurrency { success, symbols in
            if success, let symbols = symbols {
                self.updateListSymbols(list: symbols)
            } else {
            }
        }
    }
    
    private func updateListSymbols(list: Currency) {
        profile.toggleActivityIndicator.isHidden = true
        let sortingSymbols = list.symbols.map{(key, value) in  key }
        self.listOfSymbols = sortingSymbols.sorted(by: <)
        self.tableView.reloadData()
    }

}

