//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artur Anissimov on 22.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = WeatherIconManager.Rain.image
        let currentWeather = CurrentWeather(temperature: 10.0, apparentTemperature: 5.0, humidity: 30, pressure: 750, icon: icon)
        
        updateUIWith(currentWeather: currentWeather)

//      let urlString = "https://api.darksky.net/forecast/13c86f30ecdbf0c7761f3df994ccdc52/37.8267,-122.4233"
//      let baseURL = URL(string: "https://api.darksky.net/forecast/13c86f30ecdbf0c7761f3df994ccdc52/")
//      let fullURL = URL(string: "37.8267,-122.4233", relativeTo: baseURL)
//
//      let sessionconfiguration = URLSessionConfiguration.default
//      let session = URLSession(configuration: sessionconfiguration)
//
//      let request = URLRequest(url: fullURL!)
//      let dataTask = session.dataTask(with: fullURL!) { (data, response, error) in
//
//      }
//      dataTask.resume()
    }
    
    func updateUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressureLabel.text = currentWeather.pressureString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
        
    }

    @IBAction func refreshButtonTapped(_ sender: UIButton) {
    }
    
}

