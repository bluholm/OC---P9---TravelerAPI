//
//  CurrencyViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//Fixer.io

import UIKit

class CurrencyViewController: UITabBarController {

    let currencyTextField: UITextField  = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupStyle()
        setupSubView()
        setupLayout()
    }
    
    private func setupStyle() {
        //Update Colors, font , radius
        currencyTextField.center = self.view.center
        currencyTextField.placeholder = " Amount"
        currencyTextField.layer.cornerRadius = 6
        currencyTextField.layer.borderWidth = 1
        currencyTextField.layer.borderColor = UIColor.systemGray6.cgColor
        currencyTextField.backgroundColor = UIColor.systemGray6
    }
    
    private func setupSubView() {
        //self.add.subview(...)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "change", style: .plain, target: self, action: #selector(chooseCurrencyTapped))
        view.addSubview(currencyTextField)
    }
    
    private func setupLayout() {
        //constraintes Here
        NSLayoutConstraint.activate([
            
        ])
    }
    
    
    @objc func chooseCurrencyTapped() {
        let tableCurrecny = TableCurrencyViewController()
        navigationController?.pushViewController(tableCurrecny, animated: true)  
    }

}
