//
//  currencyView.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-04.
//

import UIKit

class CurrencyView: UIView {
    
    // MARK: Properties
    private let currencyTextField = UITextField()
    private let answerTextField = UITextField()
    private let convertButton = UIButton(type: .system)
    private let localeCurrencyLabel = UILabel()
    private let newCurrencyLabel = UILabel()
    private let exampleLabel = UILabel()
    let choosenCurrency = ["EU":"France"]
    
    // MARK: Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupSubView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    private func setupStyle() {
        currencyTextField.translatesAutoresizingMaskIntoConstraints = false
        currencyTextField.placeholder = " Amount"
        currencyTextField.layer.cornerRadius = 6
        currencyTextField.layer.borderWidth = 1
        currencyTextField.layer.borderColor = UIColor.systemGray6.cgColor
        currencyTextField.backgroundColor = UIColor.systemGray6
        currencyTextField.textAlignment = .natural
        
        answerTextField.placeholder = " Result"
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        answerTextField.layer.cornerRadius = 6
        answerTextField.layer.borderWidth = 1
        answerTextField.layer.borderColor = UIColor.systemGray6.cgColor
        answerTextField.backgroundColor = UIColor.systemGray6
        answerTextField.textAlignment = .natural
        answerTextField.isUserInteractionEnabled = false
        
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        convertButton.setTitle("Convert", for: .normal)
        convertButton.backgroundColor = .systemTeal
        convertButton.setTitleColor(UIColor.white, for: .normal)
        convertButton.layer.cornerRadius = 8
        convertButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 33)
        
        localeCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        localeCurrencyLabel.textAlignment = .left
        localeCurrencyLabel.text = "EUR"
        localeCurrencyLabel.font = UIFont(name: "Avenir Next", size: 14)
        
        newCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        newCurrencyLabel.textAlignment = .left
        newCurrencyLabel.text = "USD"
        newCurrencyLabel.font = UIFont(name: "Avenir Next", size: 14)
        
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        exampleLabel.textAlignment = .left
        exampleLabel.text = "1$ = 1,23€"
        exampleLabel.font = UIFont(name: "Avenir Next", size: 14)
        
        newCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupSubView() {
        self.addSubview(currencyTextField)
        self.addSubview(localeCurrencyLabel)
        self.addSubview(answerTextField)
        self.addSubview(newCurrencyLabel)
        self.addSubview(exampleLabel)
        self.addSubview(convertButton)
    }
    
    private func setupLayout() {
            NSLayoutConstraint.activate([
                currencyTextField.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 60),
                currencyTextField.widthAnchor.constraint(equalToConstant: 300),
                currencyTextField.heightAnchor.constraint(equalToConstant: 60),
                currencyTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                
                localeCurrencyLabel.topAnchor.constraint(equalTo: currencyTextField.bottomAnchor, constant: 8),
                localeCurrencyLabel.rightAnchor.constraint(equalTo: currencyTextField.rightAnchor),
                
                answerTextField.topAnchor.constraint(equalTo: localeCurrencyLabel.bottomAnchor, constant: 20),
                answerTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                answerTextField.heightAnchor.constraint(equalToConstant: 60),
                answerTextField.widthAnchor.constraint(equalToConstant: 300),
                
                newCurrencyLabel.topAnchor.constraint(equalTo: answerTextField.bottomAnchor, constant: 8),
                newCurrencyLabel.rightAnchor.constraint(equalTo: answerTextField.rightAnchor),
                
                exampleLabel.topAnchor.constraint(equalTo: newCurrencyLabel.bottomAnchor,constant: 8),
                exampleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                
                convertButton.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 60),
                convertButton.heightAnchor.constraint(equalToConstant: 60),
                convertButton.widthAnchor.constraint(equalToConstant: 260),
                convertButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
    
    
    
    
}
