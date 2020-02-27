//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artur Anissimov on 22.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var locationManager = CLLocationManager()

    lazy var weatherManager = APIWeatherManager(apiKey: "4c9f70a74459b9b4b5ae145c4d99b575")
    let coordinates = Coordinates(latitude: 58.366529, longitude: 26.790602)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest /* Наилучшая точность */
        locationManager.requestAlwaysAuthorization() /* Запрашивать на местоположение при запуске приложения */
        locationManager.startUpdatingLocation() /* Получаем наши координаты */
        
        getCurrentWeatherData()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last! as CLLocation
        
        print("user latitude: \(userLocation.coordinate.latitude), user longitude: \(userLocation.coordinate.longitude)")

        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil { print("Error in reverseGeocode") }
            
            let placemark = placemarks! as [CLPlacemark]
            
            if placemark.count > 0 {
                let placemark = placemarks![0]
                self.locationLabel.text = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    func toggleActivityIndicator(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func getCurrentWeatherData() {
        
        self.toggleActivityIndicator(on: false)
        
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            switch result {
            case .Success(let currentWeather):
                self.updateUIWith(currentWeather: currentWeather)
            case .Failure(let error as NSError):
                self.alertController(title: "Unable to get data", message: "\(error.localizedDescription)")
            }
        }
    }
    
    func alertController(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func updateUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressureLabel.text = currentWeather.pressureString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
        
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        
        toggleActivityIndicator(on: true)
        getCurrentWeatherData()
        
        refreshButton.setTitle("Data has been refreshed", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.refreshButton.setTitle("Refresh", for: .normal)
        }
        
    }
    
}

