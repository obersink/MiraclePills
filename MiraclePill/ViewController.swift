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
    }
}
