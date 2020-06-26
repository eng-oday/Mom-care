//
//  MotherRegisterVC.swift
//  MomCare
//
//  Created by Eissa on 3/31/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import BEMCheckBox
import ActionSheetPicker_3_0

protocol MotherRegisterProtocol: class {
    
    func setName(name: String)
    func setphoneNumber(phoneNum: String)
    func setEmail(email: String)
    func setPassword(password: String)
    func setDiseasesType(disease: String)
    func getName() -> String
    func getPhoneNumber() -> String
    func getEmail() -> String
    func getPassword() -> String
    func getDiseasesType() -> String
    func acceptTerms() -> Bool
    func pushViewController()
}

class MotherRegisterVC: UIViewController {
    
    @IBOutlet weak var lgoImg: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var showPassword: UIButton!
    @IBOutlet weak var diseaseType: UILabel!
    @IBOutlet weak var dropDown: UIButton!
    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var diseasesChoosenAction: UIView!
    @IBOutlet weak var nextView: CircleView!
    @IBOutlet weak var nextImg: UIImageView!
    @IBOutlet weak var beforeView: CircleView!
    @IBOutlet weak var beforeImg: UIImageView!
    
    let paragraphStyle = NSMutableParagraphStyle()
    @objc func actionPickerDone() {}
    @objc func actionPickerCancel() {}
    
    var motherRegisterPresenter: MotherRegisterPresenter!
    
    var diseasesArray = ["Heart", "Diabetes", "Anemia", "Kidney failure", "Cancer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.checkBox.on = false
        self.checkBox.boxType = .square
        motherRegisterPresenter = MotherRegisterPresenter(motherRegister: self)
        paragraphStyle.alignment = .center
        setUpImagesViews()
        tapGesture()
    }

    // Mark: - func of putting images for UIViews
    func setUpImagesViews() {
        self.lgoImg.image = UIImage(named: "OBJECTS-1")
        self.nextImg.image = UIImage(named: "arrow_pointt")
        self.beforeImg.image = UIImage(named: "arrow_pointt")
        self.showPassword.setBackgroundImage(UIImage(named: "Password-View"), for: .normal)
        self.dropDown.setBackgroundImage(UIImage(named: "downarrow"), for: .normal)
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
      
        let nextTapGesture = UITapGestureRecognizer(target: self, action: #selector(nextPage))
        self.nextView.addGestureRecognizer(nextTapGesture)
        
        let beforeTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.goToBeforePag))
        self.beforeView.addGestureRecognizer(beforeTapGesture)
        
        let diseasesTapGesture = UITapGestureRecognizer(target: self, action: #selector(chooseDieases))
        self.diseasesChoosenAction.addGestureRecognizer(diseasesTapGesture)
    }
    
    // Mark: - func of showing and hiding user password
    func showUserPassword() {
        
        if self.passwordTF.text?.count != 0 {
            
            if passwordTF.isSecureTextEntry == true {
                
                // show password
                passwordTF.isSecureTextEntry = false
                self.showPassword.setBackgroundImage(UIImage(named: "hidden"), for: .normal)
            }
            else {
                // hide password
                passwordTF.isSecureTextEntry = true
                self.showPassword.setBackgroundImage(UIImage(named: "Password-View"), for: .normal)
            }
        }
        else {
            Alert.showErrorAlert(title: "Nothing to show please enter password\n", body: "")
        }
    }
    
    // Mark: - func of choose diseases
    @objc func chooseDieases() {
        
        let pick = ActionSheetStringPicker(title: "Diseases", rows: diseasesArray, initialSelection: 0, doneBlock: { picker, indexes, values in
            print(indexes)
            print(values!)
            
            let diseaseChoosen = self.diseasesArray[indexes]
            self.diseaseType.text = diseaseChoosen
            self.diseaseType.textColor = .black
            
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
    
    @IBAction func showPasswordBtn(_ sender: Any) {
        showUserPassword()
    }
    
    @IBAction func diseasesDropDown(_ sender: Any) {
        chooseDieases()
    }
    
    // Mark: - func of going to next page
    @objc func nextPage() {
        self.motherRegisterPresenter.registerBtn()
    }
    
    // Mark: - func of go back to previous screen
    @objc func goToBeforePag() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}

// Mark: - adapt this class to the protocol and handle the protocol's functions
extension MotherRegisterVC: MotherRegisterProtocol {
    
    func setName(name: String) {
        self.nameTF.text = name
    }
    
    func setphoneNumber(phoneNum: String) {
        self.phoneNumTF.text = phoneNum
    }
    
    func setEmail(email: String) {
        self.emailTF.text = email
    }
    
    func setPassword(password: String) {
        self.passwordTF.text = password
    }
    
    func setDiseasesType(disease: String) {
        self.diseaseType.text = disease
    }
    
    func getName() -> String {
        return nameTF.text ?? ""
    }
    
    func getPhoneNumber() -> String {
        return phoneNumTF.text ?? ""
    }
    
    func getEmail() -> String {
        return emailTF.text ?? ""
    }
    
    func getPassword() -> String {
        return passwordTF.text ?? ""
    }
    
    func getDiseasesType() -> String {
        return diseaseType.text ?? ""
    }
    
    func acceptTerms() -> Bool {
        return self.checkBox.on
    }
    
    func pushViewController() {
        let vc = CompleteRegisterVC(nibName: "CompleteRegisterVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
