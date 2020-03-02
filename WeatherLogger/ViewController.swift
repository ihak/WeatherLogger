//
//  ViewController.swift
//  WeatherLogger
//
//  Created by Hassan Ahmed on 02/03/2020.
//  Copyright © 2020 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD

class ViewController: UIViewController {
    let CurrentCell = "CurrentCell"
    let HistoryCell = "HistoryCell"
    
    let locationManager = CLLocationManager()
    var coordinates: CLLocationCoordinate2D? {
        didSet {
            if let coordinates = coordinates {
                let lat = String(coordinates.latitude)
                let lon = String(coordinates.longitude)
                
                fetchWeather(lon: lon, lat: lat)
            }
        }
    }
    
    var result: Result? {
        didSet {
            if let _ = result {
                tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.requestWhenInUseAuthorization()
        
        switch(CLLocationManager.authorizationStatus()) {
        case .restricted, .notDetermined:
            fetchLocation()
        case .denied:
            showPermissionErrorAlert()
        case .authorizedAlways, .authorizedWhenInUse:
            fetchLocation()
        @unknown default:
            fatalError()
        }
    }
    
    func showPermissionErrorAlert() {
        let alert = UIAlertController(title: "Location Permissions", message: "Please enable location services and give location permissions to see current weather. You can enable it in the Settings App.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func fetchLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        else {
            showPermissionErrorAlert()
        }
    }
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        if let result = self.result {
            let dic: [String:String] = [
                "date": Date().format()!,
                "temp" : String(result.main.temp),
                "icon": result.weather.icon
            ]
            UserDefaults.standard.setValue(dic, forKey: "hist")
            UserDefaults.standard.synchronize()
        }
    }
    
    func fetchWeather(lon: String, lat: String) {
        DispatchQueue.main.async {
            APIClient.getWeather(with: lat, lon: lon) { (result, error) in
                self.result = result
            }
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.coordinates = locValue
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.section == 0 {
            
            let currentCell = tableView.dequeueReusableCell(withIdentifier: CurrentCell) as! CurrentWeatherCell
            currentCell.model = self.result
            cell = currentCell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell) as! HistoryWeatherCell
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Current" : "History"
    }
}
