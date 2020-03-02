//
//  APIClient.swift
//  WeatherLogger
//
//  Created by Hassan Ahmed on 02/03/2020.
//  Copyright © 2020 Arpatech Pvt. Ltd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {

    private class func getWeather(params: [String : String], callback: @escaping (_ result: Result?, _ error: Error?)->Void) {
        
        AF.request(Environment.baseURL, parameters: params).responseJSON { (response) in
            var value: Result?
            var err: Error?
            
            switch(response.result) {
            case .success(let a):
                let json = JSON(a)
                value = Result(json: json)
            case .failure(let error):
                err = error
            }
            callback(value, err)
        }
    }
    
    class func getWeather(with cityName: String, callback:@escaping (_ result: Result?, _ error: Error?)->Void) {
        
        let parameters = [
            "appid" : Environment.APIKey,
            "q" : cityName,
            "units": Environment.unit.rawValue
        ]
        getWeather(params: parameters, callback: callback)
    }
    
    class func getWeather(with lat: String, lon: String, callback:@escaping (_ result: Result?, _ error: Error?)->Void) {
        
        let parameters = [
            "appid" : Environment.APIKey,
            "lat" : lat,
            "lon" : lon,
            "units": Environment.unit.rawValue
        ]
        getWeather(params: parameters, callback: callback)
    }
}
