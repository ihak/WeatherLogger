//
//  Weather.swift
//  WeatherLogger
//
//  Created by Hassan Ahmed on 02/03/2020.
//  Copyright © 2020 Arpatech Pvt. Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON

class Result {
    class Coordinates {
        var lon: Double
        var lat: Double
        
        init(json: JSON) {
            lon = json["lon"].doubleValue
            lat = json["lat"].doubleValue
        }
    }
    
    class Weather {
        var id: Int
        var main: String
        var description: String
        var icon: String
        
        init(json: JSON) {
            id = json["id"].intValue
            main = json["main"].stringValue
            description = json["description"].stringValue
            icon = json["icon"].stringValue
        }
    }
    
    class Main {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
        
        init(json: JSON) {
            temp = json["temp"].doubleValue
            feels_like = json["feels_like"].doubleValue
            temp_min = json["temp_min"].doubleValue
            temp_max = json["temp_max"].doubleValue
            pressure = json["pressure"].doubleValue
            humidity = json["humidity"].doubleValue
        }
    }
    
    var dt: Int
    var main: Main
    var weather: Weather
    var coord: Coordinates
    var name: String
    
    init(json: JSON) {
        dt = json["dt"].intValue
        main = Main(json: json["main"])
        coord = Coordinates(json: json["coord"])
        
        weather = Weather(json: json["weather"].arrayValue.first!)
        name = json["name"].stringValue
    }
}
