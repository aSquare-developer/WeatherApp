//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Artur Anissimov on 22.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit

struct CurrentWeather {
    
    let temperature: Double
    let appearentTemperature: Double
    let humidity: Double
    let pressure: Double
    let icon: UIImage
    
}

extension CurrentWeather {
    
    var pressureString: String {
        return "\(Int(pressure)) mm"
    }
    
    var humidityString: String {
        return "\(Int(humidity))%"
    }
    
    var temperatureString: String {
        return "\(Int(temperature))˚C"
    }
    
    var appearentTemperatureString: String {
        return "\(Int(appearentTemperature))˚C"
    }
}
