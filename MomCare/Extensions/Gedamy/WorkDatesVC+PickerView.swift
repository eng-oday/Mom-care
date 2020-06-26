//
//  WorkDatesVC+PickerView.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import UIKit

extension WorkDatesVC {
    
    func creatTimePickerView(textField : UITextField) {
        let timePickerView = UIDatePicker()
        timePickerView.datePickerMode = .time
        textField.inputView = timePickerView
        switch textField {
        case startTime:
            timePickerView.addTarget(self, action:#selector(startTimePickerValueChanged(datePicker:)), for: .valueChanged)
        case endTime:
        timePickerView.addTarget(self, action:#selector(endTimePickerValueChanged(datePicker:)), for: .valueChanged)
        default:
            return
        }
    }
    
    @objc func endTimePickerValueChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        endTime.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func startTimePickerValueChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        startTime.text = dateFormatter.string(from: datePicker.date)
    }
    
    func creatToolBar(text : UITextField) {
        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        switch text {
        case startTime:
            todayButton = UIBarButtonItem(title: "Now", style: .plain, target: self, action: #selector(todayStartTimeBuPressed(sender:)))
        case startTime:
            todayButton = UIBarButtonItem(title: "Now", style: .plain, target: self, action: #selector(todayEndTimeBuPressed(sender:)))
        default:
            return
        }
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed(sender:)))
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: 40))
        label.text = "Choose your Time"
        let labelButton = UIBarButtonItem(customView:label)
           let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([todayButton,flexibleSpace,labelButton,flexibleSpace,doneButton], animated: true)
    }
    
    @objc func todayStartTimeBuPressed(sender: UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        startTime.text = dateFormatter.string(from: Date()) // 2
        startTime.resignFirstResponder()
    }
        
        @objc func todayEndTimeBuPressed(sender: UIBarButtonItem ) {
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            endTime.text = dateFormatter.string(from: Date()) // 2
            endTime.resignFirstResponder()
    }
    
    @objc func doneButtonPressed(sender: UIBarButtonItem) {
        endTime.resignFirstResponder()
        startTime.resignFirstResponder()
    }
    
}
