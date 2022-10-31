//
//  CurrencyViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//Fixer.io

import UIKit

class CurrencyViewController: UITabBarController {

    let currencyTextField: UITextField  = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 60))
    let submit = UIButton(type: .system)
    let newCurrencyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupStyle()
        setupSubView()
        setupLayout()
    }
    
    private func setupStyle() {
        currencyTextField.center = self.view.center
        currencyTextField.placeholder = " Amount"
        currencyTextField.layer.cornerRadius = 6
        currencyTextField.layer.borderWidth = 1
        currencyTextField.layer.borderColor = UIColor.systemGray6.cgColor
        currencyTextField.backgroundColor = UIColor.systemGray6
        currencyTextField.backgroundColor = UIColor.systemGray6
        currencyTextField.textAlignment = .left
        
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("Convert", for: .normal)
        submit.backgroundColor = .systemTeal
        submit.setTitleColor(UIColor.white, for: .normal)
        submit.layer.cornerRadius = 8
        submit.titleLabel?.font = UIFont(name: "Avenir Next", size: 33)
        
        newCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        newCurrencyLabel.textAlignment = .left
        newCurrencyLabel.text = "EUR"
        newCurrencyLabel.font = UIFont(name: "Avenir Next", size: 14)
    }
    
    private func setupSubView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change", style: .plain, target: self, action: #selector(chooseCurrencyTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemTeal
        view.addSubview(currencyTextField)
        view.addSubview(submit)
        view.addSubview(newCurrencyLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            currencyTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60),
            
            submit.topAnchor.constraint(equalTo: currencyTextField.bottomAnchor, constant: 60),
            submit.heightAnchor.constraint(equalToConstant: 60),
            submit.widthAnchor.constraint(equalToConstant: 260),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            newCurrencyLabel.topAnchor.constraint(equalTo: currencyTextField.bottomAnchor, constant: 8),
            newCurrencyLabel.rightAnchor.constraint(equalTo: currencyTextField.rightAnchor)
        ])
    }
    
    
    @objc func chooseCurrencyTapped() {
        let tableCurrecny = TableCurrencyViewController()
        navigationController?.pushViewController(tableCurrecny, animated: true)
    }

}
