//
//  ViewController.swift
//  MiraclePill
//
//  Created by Simon Zhen on 4/3/17.
//  Copyright © 2017 Simon Zhen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var buyNowContainerView: UIView!
    
    //MARK: PROPERTIES
    let states = ["Alaska", "Arkansas", "California","Maine"]
    var hasStateBtnPressed = false
    
    //MARK: METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set current View Controller as delegate of UIPickerView
        statePicker.dataSource = self
        statePicker.delegate = self
    }
}

//MARK: PICKER VIEW
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: .normal)
        statePicker.isHidden = true
        countryLabel.isHidden = false
        countryTextField.isHidden = false
        zipCodeLabel.isHidden = false
        zipCodeTextField.isHidden = false
        buyNowContainerView.isHidden = false
    }
}

//MARK: ACTIONS
extension ViewController {
    
    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = false;
        if !hasStateBtnPressed {
            hasStateBtnPressed = true
            statePickerBtn.setTitle(states[0], for: .normal)
        }
        countryLabel.isHidden = true
        countryTextField.isHidden = true
        zipCodeLabel.isHidden = true
        zipCodeTextField.isHidden = true
        buyNowContainerView.isHidden = true
    }
    
    @IBAction func buyNowPressed(_ sender: Any) {
        fullNameLabel.isHidden = true
        fullNameTextField.isHidden = true
        streetAddressLabel.isHidden = true
        streetAddressTextField.isHidden = true
        cityLabel.isHidden = true
        cityTextField.isHidden = true
        statePickerBtn.isHidden = true
        countryLabel.isHidden = true
        countryTextField.isHidden = true
        zipCodeLabel.isHidden = true
        zipCodeTextField.isHidden = true
        buyNowContainerView.isHidden = true
    }
}
