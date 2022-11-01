//
//  ListCurrenciesViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//

import UIKit

final class SymbolsViewController: UIViewController {

    // MARK: Properties
    private let mytableView = UITableView()
    private let identifierCell = "myCell"
    private var Lisymbols = [String]()
    
    // - MARK: Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose Currency"
        setupStyle()
        setupSubView()
        setupLayout()
        
        // FIXME: msut go in the models !
        CalculateCurrency().getCurrency { success, symbols in
            if success, let symbols = symbols {
                //qqchose a faire ?!
                self.Lisymbols = symbols
                
            } else {
                // display an error message
                print("error")
            }
        }
    }
    
    // -MARK: Actions
    private func setupStyle() {
        //Update Colors, font , radius
    }
    
    private func setupSubView() {
        mytableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Lisymbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        cell.textLabel?.text = Lisymbols[indexPath.row]
        return cell
    }
}
