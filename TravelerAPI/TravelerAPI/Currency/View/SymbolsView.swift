//
//  SymbolsView.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//

import UIKit

class SymbolsView: UITableViewController {
    
    // MARK: Properties
    private let mytableView = UITableView()
    private let titleTableView = "Choose Currency"
    private let identifierCell = "myCell"
    private let currencyService = CurrencyService()
    private var listOfSymbols = [String]()
    
    // - MARK: Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = titleTableView
        
        self.setupStyle()
        self.setupSubView()
        self.setupLayout()
        
        self.getCurrency()
    }
    
    
    // -MARK: UI Functions
    private func setupStyle() {
        //Update Colors, font , radius
    }
    
    private func setupSubView() {
        mytableView.dataSource = self
        mytableView.delegate = self
        mytableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
        view.addSubview(mytableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mytableView.topAnchor.constraint(equalTo: view.topAnchor),
            mytableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mytableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mytableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
    
    // -MARK: Custon Functions
    private func  getCurrency() {
        currencyService.getCurrency { success, symbols in
            if success, let symbols = symbols {
                print(symbols)
                self.updateListSymbols(list: symbols)
            } else {
                //error message to indicate
            }
        }
    }
    
    private func updateListSymbols(list: [String]) {
        self.listOfSymbols = list
        self.tableView.reloadData()
    }
    
}
