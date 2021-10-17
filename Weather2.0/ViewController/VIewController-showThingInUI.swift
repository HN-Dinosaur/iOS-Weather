//
//  VIewController-showThingInUI.swift
//  Weather2.0
//
//  Created by LongDengYu on 2021/6/16.
//

import Foundation
import SwiftyJSON

extension ViewController{
    func showTempAndIcon(_ json: JSON){
        weather.icon = json["now","icon"].stringValue
        weather.temp = json["now","temp"].stringValue + "˚"
        
        tempLabel.text = self.weather.temp
        iconImageView.image = UIImage(named: weather.icon)
    }
    func showCity(_ json: JSON){
        weather.city = json["location"][0]["name"].stringValue
        
        locationCityLabel.text = weather.city
    }
    func getParameter(_ location: String) -> [String: String]{
        ["location": location, "key": qQWeatherKey]
    }
}

