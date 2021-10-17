//
//  ViewController.swift
//  Weather2.0
//
//  Created by LongDengYu on 2021/6/14.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
  
    
    var locationManager = CLLocationManager()
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var locationCityLabel: UILabel!
    let weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //请求用户授权获取位置
        locationManager.requestWhenInUseAuthorization()

        locationManager.delegate = self
        //请求的位置精度
//        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //请求位置  此方法调用底下两个func
        //异步请求
        locationManager.requestLocation()
    }
    
    
    //传值
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //判断当前目的地是否是通过右上角按钮到达的页面
        if let vc = segue.destination as? InquiryViewController{
            vc.currentCity = weather.city
            vc.delegate = self
        }
    }
}

