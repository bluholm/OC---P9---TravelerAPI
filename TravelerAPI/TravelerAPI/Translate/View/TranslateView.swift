//
//  TranslateViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//

import UIKit

final class TranslateViewController: UIViewController {

    // MARK: Properties
    private let textToTranslate = UITextView()
    private let textTranslated = UILabel()
    private let translateButton = UIButton(type: .system)
    private let userLangage = UILabel()
    private let translatedLangageLabel = UILabel()
    
    // MARK: Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupSubView()
        setupLayout()
    }
    
    // MARK: UI functions
    private func setupStyle() {
        userLangage.translatesAutoresizingMaskIntoConstraints = false
        userLangage.textAlignment = .left
        userLangage.text = "French"
        userLangage.font = UIFont(name: "Avenir Next", size: 24)
        
        textToTranslate.translatesAutoresizingMaskIntoConstraints = false
        textToTranslate.layer.cornerRadius = 6
        textToTranslate.backgroundColor = UIColor.systemGray6
        
        translatedLangageLabel.translatesAutoresizingMaskIntoConstraints = false
        translatedLangageLabel.textAlignment = .left
        translatedLangageLabel.text = "English"
        translatedLangageLabel.font = UIFont(name: "Avenir Next", size: 24)
        
        textTranslated.translatesAutoresizingMaskIntoConstraints = false
        textTranslated.textAlignment = .left
        textTranslated.text = "text will be translate here"
        textTranslated.textColor = .systemGray3
        textTranslated.backgroundColor = .systemGray6
        textTranslated.font = UIFont(name: "Avenir Next", size: 24)
        
        
        translateButton.translatesAutoresizingMaskIntoConstraints = false
        translateButton.setTitle("Translate", for: .normal)
        translateButton.backgroundColor = .systemTeal
        translateButton.setTitleColor(UIColor.white, for: .normal)
        translateButton.layer.cornerRadius = 8
        translateButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 33)
    }
    
    private func setupSubView() {
        view.addSubview(userLangage)
        view.addSubview(textToTranslate)
        view.addSubview(translatedLangageLabel)
        view.addSubview(textTranslated)
        view.addSubview(translateButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            userLangage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 0),
            userLangage.leftAnchor.constraint(equalTo: textToTranslate.leftAnchor,constant: 0),
            
            textToTranslate.topAnchor.constraint(equalTo: userLangage.bottomAnchor, constant: 8),
            textToTranslate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textToTranslate.heightAnchor.constraint(equalToConstant: 180),
            textToTranslate.widthAnchor.constraint(equalToConstant: 350),
            
            translatedLangageLabel.topAnchor.constraint(equalTo: textToTranslate.bottomAnchor,constant: 10),
            translatedLangageLabel.leftAnchor.constraint(equalTo: textToTranslate.leftAnchor,constant: 0),
            
            textTranslated.topAnchor.constraint(equalTo: translatedLangageLabel.bottomAnchor, constant: 8),
            textTranslated.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textTranslated.heightAnchor.constraint(equalToConstant: 180),
            textTranslated.widthAnchor.constraint(equalToConstant: 350),
        
            translateButton.topAnchor.constraint(equalTo: textTranslated.bottomAnchor, constant: 20),
            translateButton.heightAnchor.constraint(equalToConstant: 60),
            translateButton.widthAnchor.constraint(equalToConstant: 260),
            translateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
