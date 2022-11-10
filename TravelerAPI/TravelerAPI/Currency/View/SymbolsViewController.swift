//
//  SymbolsViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-02.
//

import UIKit

final class SymbolsTableViewController: UITableViewController {

    // MARK: Properties
    private let toggleActivityIndicator = UIActivityIndicatorView()
    private let identifierCell = "symbolCell"
    private var listOfSymbols = [String]()
    private let titleTableView = "Choose Currency"
    private let controller = CurrencyController()
    
    
    // MARK: - Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        self.controller.view = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.controller.view = self
    }
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupStyle()
        self.setupSubView()
        self.setupLayout()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.controller.OnViewLoad()
    }
    
    // MARK: Private
    private func setupStyle() {
        //Update Colors, font , radius
        toggleActivityIndicator.isHidden = false
        toggleActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        toggleActivityIndicator.style = .large
        toggleActivityIndicator.startAnimating()
    }
    
    private func setupSubView() {
        navigationItem.title = titleTableView
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
        view.addSubview(toggleActivityIndicator)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.rightAnchor.constraint(equalTo: view.rightAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
        let cell = self.tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        cell.textLabel?.text = listOfSymbols[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CurrencyViewController().choosenCurrency = listOfSymbols[indexPath.row]
        return
    }
    
    // - MARK: Accessible
    func LoadListOfSymbols(list: Currency) {
        self.toggleActivityIndicator.isHidden = true
        SortbyNameListOfCurrency(list: list)
        print("aa \(list)")
        self.tableView.reloadData()
    }
    
    // - MARK: Custom Functions
    private func SortbyNameListOfCurrency(list: Currency) {
        let sortingSymbols = list.symbols.map{(key, value) in  key }
        self.listOfSymbols = sortingSymbols.sorted(by: <)
    }
}
