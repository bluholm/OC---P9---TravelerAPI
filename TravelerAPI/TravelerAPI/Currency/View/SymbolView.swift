//
//  SymbolView.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-04.
//

import UIKit

final class SymbolView: UITableView {
    
    // MARK: Properties
    let toggleActivityIndicator = UIActivityIndicatorView()
    let identifierCell = "symbolCell"
    
    // MARK: Private
    func loadSetup() {
        self.setupStyle()
        self.setupSubView()
        self.setupLayout()
    }
    
    private func setupStyle() {
        //Update Colors, font , radius
        toggleActivityIndicator.isHidden = false
        toggleActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        toggleActivityIndicator.style = .large
        toggleActivityIndicator.startAnimating()
    }
    
    private func setupSubView() {
        self.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
        self.addSubview(toggleActivityIndicator)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.topAnchor),
            self.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            toggleActivityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            toggleActivityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            toggleActivityIndicator.heightAnchor.constraint(equalToConstant: 20),
            toggleActivityIndicator.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
