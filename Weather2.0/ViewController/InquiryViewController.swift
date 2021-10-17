//
//  InquiryViewController.swift
//  Weather2.0
//
//  Created by LongDengYu on 2021/6/15.
//

import UIKit

protocol InquiryViewControllerDelegate {
    func didChangeCity(city: String)
}

class InquiryViewController: UIViewController {

    var currentCity = ""
    var delegate: InquiryViewControllerDelegate?
    
    @IBOutlet weak var UserInput: UITextField!
    @IBOutlet weak var CurrentCityLabel: UILabel!
    @IBAction func InquiryButton(_ sender: Any) {
        dismiss(animated: true)
        //有无输入内容｜｜是否多个空格
        //修剪这个空格和空行trim
        if !UserInput.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            delegate?.didChangeCity(city: UserInput.text!)
        }
    }
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrentCityLabel.text = currentCity
        //进去第一个响应
        UserInput.becomeFirstResponder()//   UserInput.resignFirstResponder()
     
    }
    

 

}
