//
//  TableCurrencyViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//

import UIKit

class TableCurrencyViewController: UITableViewController {
    
    let mytableView = UITableView()
    var currency = ["CAD", "FR", "EUR", "YEN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupSubView()
        setupLayout()
    }
    
    
    private func setupStyle() {
        //Update Colors, font , radius
        
    }
    
    private func setupSubView() {
        mytableView.delegate = self
        mytableView.dataSource = self
        mytableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        view.addSubview(mytableView)
    }
    
    private func setupLayout() {
        mytableView.translatesAutoresizingMaskIntoConstraints = false
        mytableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mytableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mytableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mytableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    // - MARK: Delegate and DataSource UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = currency[indexPath.row]
        return cell
    }
}
