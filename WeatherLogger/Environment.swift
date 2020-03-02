//
//  Environment.swift
//  WeatherLogger
//
//  Created by Hassan Ahmed on 02/03/2020.
//  Copyright © 2020 Arpatech Pvt. Ltd. All rights reserved.
//

import Foundation

enum Unit: String {
    case matric = "matric"
    case imperial = "imperial"
}

class Environment {
    static var APIKey = "dc729facd59fc0c457cdd22945595174"
    static var baseURL = "https://api.openweathermap.org/data/2.5/weather"
    static var baseImageURL = "http://openweathermap.org/img/wn/"
    static var unit = Unit.imperial
}
