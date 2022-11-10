//
//  WeatherViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//

import UIKit

final class WeatherViewController: UIViewController {

    // MARK: Properties
    private let weatherLabelOrigin = UILabel()
    private let weatherViewOrigin = UIView()
    private let weatherLabelEndingPoint = UILabel()
    private let weatherViewEndingPoint = UIView()
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupStyle()
        self.setupSubView()
        self.setupLayout()
    }
    
    // MARK: Private
    private func setupStyle() {
        //Update Colors, font , radius
        weatherLabelOrigin.translatesAutoresizingMaskIntoConstraints = false
        weatherLabelOrigin.text = "New York, USA"
        weatherLabelOrigin.textAlignment = .left
        weatherLabelOrigin.font = UIFont(name: "Avenir Next", size: 24)
        
        
        weatherViewOrigin.translatesAutoresizingMaskIntoConstraints = false
        weatherViewOrigin.backgroundColor = .systemGray6
        weatherViewOrigin.layer.cornerRadius = 6
        
        weatherLabelEndingPoint.translatesAutoresizingMaskIntoConstraints = false
        weatherLabelEndingPoint.text = "Bunbury, Australia"
        weatherLabelEndingPoint.textAlignment = .left
        weatherLabelEndingPoint.font = UIFont(name: "Avenir Next", size: 24)
        
        weatherViewEndingPoint.translatesAutoresizingMaskIntoConstraints = false
        weatherViewEndingPoint.backgroundColor = .systemGray6
        weatherViewEndingPoint.layer.cornerRadius = 6
        
        
    }
    
    private func setupSubView() {
        //self.add.subview(...)
        view.addSubview(weatherLabelOrigin)
        view.addSubview(weatherViewOrigin)
        view.addSubview(weatherLabelEndingPoint)
        view.addSubview(weatherViewEndingPoint)
    }
    
    private func setupLayout() {
        //constraintes Here
        NSLayoutConstraint.activate([
        weatherLabelOrigin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        weatherLabelOrigin.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
        
        weatherViewOrigin.topAnchor.constraint(equalTo: weatherLabelOrigin.bottomAnchor, constant: 10),
        weatherViewOrigin.heightAnchor.constraint(equalToConstant: 160),
        weatherViewOrigin.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        weatherViewOrigin.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        
        weatherLabelEndingPoint.topAnchor.constraint(equalTo: weatherViewOrigin.bottomAnchor, constant: 35),
        weatherLabelEndingPoint.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        weatherViewEndingPoint.topAnchor.constraint(equalTo: weatherLabelEndingPoint.bottomAnchor, constant: 10),
        weatherViewEndingPoint.heightAnchor.constraint(equalToConstant: 160),
        weatherViewEndingPoint.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        weatherViewEndingPoint.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
                                    ])
    }
}
