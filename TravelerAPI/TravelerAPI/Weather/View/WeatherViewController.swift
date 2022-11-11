//
//  WeatherViewController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-28.
//

import UIKit

final class WeatherViewController: UIViewController {

    // MARK: Properties
    private let weatherLabelUp = UILabel()
    private let weatherViewUp = UIView()
    private let temperatureLabelUp = UILabel()
    private let toggleIndicatorUp = UIActivityIndicatorView()
    
    private let weatherLabelDown = UILabel()
    private let weatherViewDown = UIView()
    private let temperatureLabelDown = UILabel()
    private let toggleIndicatorDown = UIActivityIndicatorView()
    
    
    var weatherImageUp = UIImage()
    let myImageViewUp:UIImageView = UIImageView()
    var weatherImageDown = UIImage()
    let myImageViewDown:UIImageView = UIImageView()
    
    private let controller = WeatherController()
    
    // MARK: LifeCycle Method
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
        
        self.controller.onViewLoad()
        
    }
    
    // MARK: Accessible
    func displayWeatherUp(icon: String, temperature: Double) {
        toggleIndicatorUp.isHidden = true
        temperatureLabelUp.text = "\(temperature) °"
        myImageViewUp.image = UIImage(systemName: icon, withConfiguration: UIImage.SymbolConfiguration(pointSize: 60))
    }
    
    func displayWeatherDown(icon: String, temperature: Double) {
        toggleIndicatorDown.isHidden = true
        temperatureLabelDown.text = "\(temperature) °"
        myImageViewDown.image = UIImage(systemName: icon, withConfiguration: UIImage.SymbolConfiguration(pointSize: 60))
    }
    
    // MARK: Private
    private func setupStyle() {
        //Update Colors, font , radius
        myImageViewUp.translatesAutoresizingMaskIntoConstraints = false
        myImageViewUp.image = weatherImageUp
        
        weatherLabelUp.translatesAutoresizingMaskIntoConstraints = false
        weatherLabelUp.text = "New York, USA"
        weatherLabelUp.textAlignment = .left
        weatherLabelUp.font = UIFont(name: "Avenir Next", size: 24)
        
        weatherViewUp.translatesAutoresizingMaskIntoConstraints = false
        weatherViewUp.backgroundColor = .systemGray6
        weatherViewUp.layer.cornerRadius = 6
        
        temperatureLabelUp.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabelUp.text = ""
        temperatureLabelUp.textAlignment = .center
        temperatureLabelUp.font = UIFont(name: "Avenir Next", size: 20)
        
        toggleIndicatorUp.isHidden = false
        toggleIndicatorUp.translatesAutoresizingMaskIntoConstraints = false
        toggleIndicatorUp.style = .large
        toggleIndicatorUp.startAnimating()
        
        myImageViewDown.translatesAutoresizingMaskIntoConstraints = false
        myImageViewDown.image = weatherImageDown
        
        weatherLabelDown.translatesAutoresizingMaskIntoConstraints = false
        weatherLabelDown.text = "Paris, France"
        weatherLabelDown.textAlignment = .left
        weatherLabelDown.font = UIFont(name: "Avenir Next", size: 24)
        
        weatherViewDown.translatesAutoresizingMaskIntoConstraints = false
        weatherViewDown.backgroundColor = .systemGray6
        weatherViewDown.layer.cornerRadius = 6
        
        temperatureLabelDown.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabelDown.text = ""
        temperatureLabelDown.textAlignment = .center
        temperatureLabelDown.font = UIFont(name: "Avenir Next", size: 20)
        
        toggleIndicatorDown.isHidden = false
        toggleIndicatorDown.translatesAutoresizingMaskIntoConstraints = false
        toggleIndicatorDown.style = .large
        toggleIndicatorDown.startAnimating()
        
        
        
    }
    
    private func setupSubView() {
        //self.add.subview(...)
        view.addSubview(weatherLabelUp)
        view.addSubview(weatherViewUp)
        weatherViewUp.addSubview(toggleIndicatorUp)
        weatherViewUp.addSubview(myImageViewUp)
        weatherViewUp.addSubview(temperatureLabelUp)
        
        view.addSubview(weatherLabelDown)
        view.addSubview(weatherViewDown)
        weatherViewDown.addSubview(toggleIndicatorDown)
        weatherViewDown.addSubview(myImageViewDown)
        weatherViewDown.addSubview(temperatureLabelDown)
        
    }
    
    private func setupLayout() {
        //constraintes Here
        NSLayoutConstraint.activate([
            weatherLabelUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherLabelUp.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            
            weatherViewUp.topAnchor.constraint(equalTo: weatherLabelUp.bottomAnchor, constant: 10),
            weatherViewUp.heightAnchor.constraint(equalToConstant: 160),
            weatherViewUp.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            weatherViewUp.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            temperatureLabelUp.bottomAnchor.constraint(equalTo: weatherViewUp.bottomAnchor, constant: -8),
            temperatureLabelUp.centerXAnchor.constraint(equalTo: weatherViewUp.centerXAnchor),
            
            myImageViewUp.centerXAnchor.constraint(equalTo: weatherViewUp.centerXAnchor),
            myImageViewUp.centerYAnchor.constraint(equalTo: weatherViewUp.centerYAnchor),
            
            toggleIndicatorUp.centerXAnchor.constraint(equalTo: weatherViewUp.centerXAnchor),
            toggleIndicatorUp.centerYAnchor.constraint(equalTo: weatherViewUp.centerYAnchor),
            
            weatherLabelDown.topAnchor.constraint(equalTo: weatherViewUp.bottomAnchor, constant: 35),
            weatherLabelDown.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            weatherViewDown.topAnchor.constraint(equalTo: weatherLabelDown.bottomAnchor, constant: 10),
            weatherViewDown.heightAnchor.constraint(equalToConstant: 160),
            weatherViewDown.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            weatherViewDown.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            temperatureLabelDown.bottomAnchor.constraint(equalTo: weatherViewDown.bottomAnchor, constant: -8),
            temperatureLabelDown.centerXAnchor.constraint(equalTo: weatherViewDown.centerXAnchor),
            
            myImageViewDown.centerXAnchor.constraint(equalTo: weatherViewDown.centerXAnchor),
            myImageViewDown.centerYAnchor.constraint(equalTo: weatherViewDown.centerYAnchor),
            
            toggleIndicatorDown.centerXAnchor.constraint(equalTo: weatherViewDown.centerXAnchor),
            toggleIndicatorDown.centerYAnchor.constraint(equalTo: weatherViewDown.centerYAnchor),
            
            
        ])
    }
    
}
