//
//  WeatherController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-11.
//

import UIKit


final class WeatherController {
    
    // MARK: Properties
    weak var view: WeatherViewController?
    private let model = WeatherLogic()
    let weatherUrlUp = "https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&current_weather=true"
    let weatherUrlDown = "https://api.open-meteo.com/v1/forecast?latitude=48.8567&longitude=2.3510&current_weather=true"

    
    //MARK: Accessibles
    func onViewLoad() {
        self.model.getWeather(url: weatherUrlUp) { sucess, data in
            if sucess, let data=data {
                self.updateFieldWeatherUp(element: data)
            } else {
                //error
            }
        }
        
        self.model.getWeather(url: weatherUrlDown) { sucess, data in
            if sucess, let data=data {
                self.updateFieldWeatherDown(element: data)
            } else {
                //error
            }
        }
    }
    
    //MARK: Privates
    private func updateFieldWeatherUp(element: Weather) {
        let icon = model.getCodeWeather(code: element.currentWeather.weathercode)
        let temperature = element.currentWeather.temperature
        self.view?.displayWeatherUp(icon: icon, temperature: temperature)
    }
    
    private func updateFieldWeatherDown(element: Weather) {
        let icon = model.getCodeWeather(code: element.currentWeather.weathercode)
        let temperature = element.currentWeather.temperature
        self.view?.displayWeatherDown(icon: icon, temperature: temperature)
    }
}
