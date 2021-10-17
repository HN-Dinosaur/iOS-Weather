//
//  ViewController-CLLocationManagerDelegate.swift
//  Weather2.0
//
//  Created by LongDengYu on 2021/6/16.
//

import Foundation
import CoreLocation
import SwiftyJSON
import Alamofire

extension ViewController: CLLocationManagerDelegate{
    //成功获取用户位置一次
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //经度
        let lon = locations[0].coordinate.longitude
        //纬度
        let lat = locations[0].coordinate.latitude
        //通过第三方包的Http请求Api获取天气信息参数（经纬度）&（key）
        //异步请求
        AF.request(qQWeatherNowPath,parameters: getParameter("\(lon),\(lat)")).responseJSON{
            responds in
            //请求获取天气信息
            if let data = responds.value{
                //通过第三方包将data转换为JSON
                self.showTempAndIcon(JSON(data))
              
            }
            
        }
        AF.request(qQWeatherCityPath,parameters: getParameter("\(lon),\(lat)")).responseJSON{
            responds in
            if let data = responds.value{
                self.showCity(JSON(data))
          
            }
        }

    }
    //不能获取用户位置
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationCityLabel.text = "获取位置失败"
    }
}
