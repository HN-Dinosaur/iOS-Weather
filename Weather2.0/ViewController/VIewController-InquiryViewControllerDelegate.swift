//
//  VIewController-InquiryViewControllerDelegate.swift
//  Weather2.0
//
//  Created by LongDengYu on 2021/6/16.
//

import Foundation
import SwiftyJSON
import Alamofire

extension ViewController: InquiryViewControllerDelegate{
    func didChangeCity(city: String) {
        AF.request(qQWeatherCityPath, parameters: getParameter(city)).responseJSON{
            responds in
            if let data = responds.value{
                let json = JSON(data)
                self.showCity(json)
                
                //找到city再得到cityID
                let cityID = json["location"][0]["id"].stringValue
                AF.request(qQWeatherNowPath,parameters: self.getParameter(cityID)).responseJSON{
                    responds in
                    //请求获取天气信息
                    if let data = responds.value{
                        //本就是JSON  用第三方包更好的处理JSON数据
                        let json = JSON(data)
                        
                        self.showTempAndIcon(json)
                    }
                    
                }
            }
        }
    }
}
