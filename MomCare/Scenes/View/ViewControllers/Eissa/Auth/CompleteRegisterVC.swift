//
//  CompleteRegisterVC.swift
//  MomCare
//
//  Created by Eissa on 4/19/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

protocol BabyDetailsProtocol: class {
    
    func setDateMenstruation(Date: String)
    func getDateMenstruation() -> String
    func pushViewController()
}

class CompleteRegisterVC: UIViewController {
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dropDown: UIButton!
    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var genderView: UIView!
    
    let paragraphStyle = NSMutableParagraphStyle()
    @objc func actionPickerDone() {}
    @objc func actionPickerCancel() {}
    
    var genderArray = ["Male", "Female"]
    var babyDataPresenter: BabyData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.back.setBackgroundImage(UIImage(named: "arrow_open"), for: .normal)
        self.logoImg.image = UIImage(named: "baby")
        self.dropDown.setBackgroundImage(UIImage(named: "downarrow"), for: .normal)
        paragraphStyle.alignment = .center
        babyDataPresenter = BabyData(babyData: self)
        tapGesture()
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
      
        let dateTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectdate))
        self.viewDate.addGestureRecognizer(dateTapGesture)
        
        let genderTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectGender))
        self.genderView.addGestureRecognizer(genderTapGesture)
    }
    
    // Mark: - func of select date
    @objc func selectdate() {
        
        let datePicker = ActionSheetDatePicker(title: "Date", datePickerMode: UIDatePicker.Mode.date, selectedDate: Date(), doneBlock: {
                picker, value, index in
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                formatter.locale = Locale(identifier: "en")
                let firstDate = formatter.string(from: value! as! Date)

                let dateChosen = String(describing: firstDate)
                self.dateLabel.text = dateChosen
                self.dateLabel.textColor = UIColor.black
                
                return
            }, cancel: { ActionStringCancelBlock in return }, origin: (viewDate as AnyObject).superview!?.superview)
            let secondsInWeek: TimeInterval = 7 * 24 * 60 * 60;
            datePicker?.minimumDate = Date()
            datePicker?.minuteInterval = 20
            datePicker?.locale = Locale(identifier: "en")
        
            let bar1 = UIBarButtonItem.init(title: "Confirm", style: .plain, target: self, action: #selector(actionPickerDone))
                  let bar2 = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(actionPickerCancel))
                  // Done button
                  bar1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
                  // Cancel button
                  bar2.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
                  // title of actionsheet
                  datePicker?.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any, NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
                  datePicker?.pickerBackgroundColor = UIColor.white
                  datePicker?.toolbarBackgroundColor = UIColor.white
                  datePicker?.setDoneButton(bar1)
                  datePicker?.setCancelButton(bar2)
                  // elements in action sheet
                  datePicker?.pickerTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any,NSAttributedString.Key.paragraphStyle: paragraphStyle,NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
            datePicker?.show()
    }
    
    // Mark: - func of select gender
    @objc func selectGender() {
        
        let pick = ActionSheetStringPicker(title: "Gender", rows: genderArray, initialSelection: 0, doneBlock: { picker, indexes, values in
            print(indexes)
            print(values!)
            
            let gender = self.genderArray[indexes]
            self.genderLabel.text = gender
            self.genderLabel.textColor = .black
            
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: dropDown)
        let bar1 = UIBarButtonItem.init(title: "Confirm", style: .plain, target: self, action: #selector(actionPickerDone))
        let bar2 = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(actionPickerCancel))
        // Done button
        bar1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        // Cancel button
        bar2.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        // title of actionsheet
        pick?.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any, NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
        pick?.pickerBackgroundColor = UIColor.white
        pick?.toolbarBackgroundColor = UIColor.white
        pick?.setDoneButton(bar1)
        pick?.setCancelButton(bar2)
        // elements in action sheet
        pick?.pickerTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any,NSAttributedString.Key.paragraphStyle: paragraphStyle,NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
        pick?.show()
    }

    @IBAction func dropDownBtn(_ sender: Any) {
        selectGender()
    }
    
    @IBAction func RegisterBtn(_ sender: Any) {
        babyDataPresenter.registerButton()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let vc = LoginVC(nibName: "LoginVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// Mark: - adapt this class to the protocol and handle the protocol's functions
extension CompleteRegisterVC: BabyDetailsProtocol {
    func setDateMenstruation(Date: String) {
        self.dateLabel.text = Date
    }
    
    func getDateMenstruation() -> String {
        return self.dateLabel.text ?? ""
    }
    
    func pushViewController() {
        let vc = VerficationCodeVC(nibName: "VerficationCodeVC", bundle: nil)
        vc.isDoctor = true
        self.present(vc, animated: true, completion: nil)
    }
    
}
