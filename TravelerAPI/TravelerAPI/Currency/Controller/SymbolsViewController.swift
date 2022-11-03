//
//  SymbolsViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-02.
//

import UIKit

class SymbolsTableViewController: UITableViewController {

    // MARK: Properties
    private var listOfSymbols = [String]()
    private let currencyService = CurrencyService()
    let identifierCell = "symbolCell"
    let mytableView = UITableView()
    let toggleActivityIndicator = UIActivityIndicatorView()
    private let titleTableView = "Choose Currency"
    
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupStyle()
        self.setupSubView()
        self.setupLayout()
        
        self.getCurrency()
    }
    
    // MARK: Private
    private func setupStyle() {
        //Update Colors, font , radius
        navigationItem.title = titleTableView
        toggleActivityIndicator.isHidden = false
        toggleActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        toggleActivityIndicator.style = .large
        toggleActivityIndicator.startAnimating()
    }
    
    private func setupSubView() {
        mytableView.dataSource = self
        mytableView.delegate = self
        mytableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
        view.addSubview(mytableView)
        view.addSubview(toggleActivityIndicator)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mytableView.topAnchor.constraint(equalTo: view.topAnchor),
            mytableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mytableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mytableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            toggleActivityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggleActivityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            toggleActivityIndicator.heightAnchor.constraint(equalToConstant: 20),
            toggleActivityIndicator.widthAnchor.constraint(equalToConstant: 20)
        ])
    }

        
    
    // - MARK: Delegate and DataSource UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfSymbols.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        cell.textLabel?.text = listOfSymbols[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CurrencyViewController().choosenCurrency = listOfSymbols[indexPath.row]
        return
    }
    
    // -MARK: Custon Functions
    private func  getCurrency() {
        currencyService.getCurrency { success, symbols in
            if success, let symbols = symbols {
                self.updateListSymbols(list: symbols)
            } else {
            }
        }
    }
    
    private func updateListSymbols(list: Currency) {
        toggleActivityIndicator.isHidden = true
        let sortingSymbols = list.symbols.map{(key, value) in  key }
        self.listOfSymbols = sortingSymbols.sorted(by: <)
        self.tableView.reloadData()
    }

}

