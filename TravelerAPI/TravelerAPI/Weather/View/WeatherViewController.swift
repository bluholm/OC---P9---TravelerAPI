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
    
    var weatherImageUp = UIImage()
    let myImageViewUp:UIImageView = UIImageView()
    
    let weatherUrlUp = "https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&current_weather=true"
    let weatherUrlDown = "https://api.open-meteo.com/v1/forecast?latitude=48.8567&longitude=2.3510&current_weather=true"
    
    private let model = WeatherLogic()
    
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupStyle()
        self.setupSubView()
        self.setupLayout()
        

        self.model.getWeather(url: weatherUrlUp) { sucess, data in
            if sucess, let data=data {
                self.updateFieldWeather(element: data)
            } else {
                //error
            }
        }
        
        self.model.getWeather(url: weatherUrlDown) { sucess, data in
            if sucess, let data=data {
                //self.updateFieldWeather(element: data)
                print(data)
            } else {
                //error
            }
        }
        
    }
    
    // MARK: Private
    private func setupStyle() {
        //Update Colors, font , radius
        myImageViewUp.translatesAutoresizingMaskIntoConstraints = false
        myImageViewUp.image = weatherImageUp
        
        temperatureLabelUp.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabelUp.text = ""
        temperatureLabelUp.textAlignment = .center
        temperatureLabelUp.font = UIFont(name: "Avenir Next", size: 20)
        
        weatherLabelUp.translatesAutoresizingMaskIntoConstraints = false
        weatherLabelUp.text = "New York, USA"
        weatherLabelUp.textAlignment = .left
        weatherLabelUp.font = UIFont(name: "Avenir Next", size: 24)
        
        weatherViewUp.translatesAutoresizingMaskIntoConstraints = false
        weatherViewUp.backgroundColor = .systemGray6
        weatherViewUp.layer.cornerRadius = 6
        
        weatherLabelDown.translatesAutoresizingMaskIntoConstraints = false
        weatherLabelDown.text = "Paris, France"
        weatherLabelDown.textAlignment = .left
        weatherLabelDown.font = UIFont(name: "Avenir Next", size: 24)
        
        weatherViewDown.translatesAutoresizingMaskIntoConstraints = false
        weatherViewDown.backgroundColor = .systemGray6
        weatherViewDown.layer.cornerRadius = 6
        
        toggleIndicatorUp.isHidden = false
        toggleIndicatorUp.translatesAutoresizingMaskIntoConstraints = false
        toggleIndicatorUp.style = .large
        toggleIndicatorUp.startAnimating()
        
    }
    
    private func setupSubView() {
        //self.add.subview(...)
        view.addSubview(weatherLabelUp)
        view.addSubview(weatherViewUp)
        view.addSubview(weatherLabelDown)
        view.addSubview(weatherViewDown)
        
        weatherViewUp.addSubview(myImageViewUp)
        weatherViewUp.addSubview(temperatureLabelUp)
        weatherViewUp.addSubview(toggleIndicatorUp)
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
            
            weatherLabelDown.topAnchor.constraint(equalTo: weatherViewUp.bottomAnchor, constant: 35),
            weatherLabelDown.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            weatherViewDown.topAnchor.constraint(equalTo: weatherLabelDown.bottomAnchor, constant: 10),
            weatherViewDown.heightAnchor.constraint(equalToConstant: 160),
            weatherViewDown.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            weatherViewDown.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            temperatureLabelUp.bottomAnchor.constraint(equalTo: weatherViewUp.bottomAnchor, constant: 0),
            temperatureLabelUp.centerXAnchor.constraint(equalTo: weatherViewUp.centerXAnchor),
            
            myImageViewUp.centerXAnchor.constraint(equalTo: weatherViewUp.centerXAnchor),
            myImageViewUp.centerYAnchor.constraint(equalTo: weatherViewUp.centerYAnchor),
            
            toggleIndicatorUp.centerXAnchor.constraint(equalTo: weatherViewUp.centerXAnchor),
            toggleIndicatorUp.centerYAnchor.constraint(equalTo: weatherViewUp.centerYAnchor),
        ])
    }
    
    private func updateFieldWeather(element: Weather) {
        let icon = model.getCodeWeather(code: element.currentWeather.weathercode)
        toggleIndicatorUp.isHidden = true
        temperatureLabelUp.text = "\(element.currentWeather.temperature) °"
        myImageViewUp.image = UIImage(systemName: icon, withConfiguration: UIImage.SymbolConfiguration(pointSize: 60))
    }
}
