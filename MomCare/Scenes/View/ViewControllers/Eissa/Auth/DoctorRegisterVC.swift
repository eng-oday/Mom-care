//
//  DoctorRegisterVC.swift
//  MomCare
//
//  Created by Eissa on 3/31/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import BEMCheckBox
import UIKit
import MIAlertController
import PopupDialog
import SwiftEntryKit

protocol DoctorRegisterProtocol: class {
    
    func setName(name: String)
    func SetPhoneNumber(phoneNum: String)
    func SetCity(city: String)
    func setEmail(email: String)
    func setPassword(password: String)
    func getName() -> String
    func getPhoneNumber() -> String
    func getCity() -> String
    func getEmai() -> String
    func getPassword() -> String
    func acceptTerms() -> Bool
    func pushViewController()
}

class DoctorRegisterVC: UIViewController, SendCityData {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mapImg: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var showPassword: UIButton!
    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var chooseCityView: UIView!
    @IBOutlet weak var nextView: CircleView!
    @IBOutlet weak var nextImg: UIImageView!
    @IBOutlet weak var beforeView: CircleView!
    @IBOutlet weak var beforeImg: UIImageView!
    
    var doctorRegisterPresenter: DoctorRegisterPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.checkBox.on = false
        self.checkBox.boxType = .square
        tapGesture()
        setUpImagesViews()
        doctorRegisterPresenter = DoctorRegisterPresenter(doctorRegister: self)
    }
    
    // Mark: - func of putting images for UIViews
    func setUpImagesViews() {
        
        self.logoImg.image = UIImage(named: "OBJECTS-1")
        self.nextImg.image = UIImage(named: "arrow_pointt")
        self.beforeImg.image = UIImage(named: "arrow_pointt")
        self.mapImg.setBackgroundImage(UIImage(named: "maps-and-flags"), for: .normal)
        self.showPassword.setBackgroundImage(UIImage(named: "Password-View"), for: .normal)
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
        
        let nextTapGesture = UITapGestureRecognizer(target: self, action: #selector(nextPage))
        self.nextView.addGestureRecognizer(nextTapGesture)
        
        let beforeTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToBeforePag))
        self.beforeView.addGestureRecognizer(beforeTapGesture)
        
        let mapTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToMap))
        self.chooseCityView.addGestureRecognizer(mapTapGesture)

    }
    
    // Mark: - handle SendCityDataProtocol function
    func sendCity(cityName: String) {
        self.cityLabel.textColor = UIColor.black
        self.cityLabel.text = cityName
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
    
    @IBAction func showPassword(_ sender: Any) {
        showUserPassword()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        // go to login screen
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mapBtn(_ sender: Any) {
        let vc = MapVC(nibName: "MapVC", bundle: nil)
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    // Mark: - func of going to next page
    @objc func nextPage() {
        self.doctorRegisterPresenter.registerBtn()
    }
    
    // Mark: - func of go back to previous screen
    @objc func goToBeforePag() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Mark: - func of go to map
    @objc func goToMap() {
        let vc = MapVC(nibName: "MapVC", bundle: nil)
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
}

// Mark: - adapt this class to protocol and handle the protocol's functions
extension DoctorRegisterVC: DoctorRegisterProtocol {
    func setName(name: String) {
        self.nameTF.text = name
    }
    
    func SetPhoneNumber(phoneNum: String) {
        self.phoneNumTF.text = phoneNum
    }
    
    func SetCity(city: String) {
        self.cityLabel.text = city
    }
    
    func setEmail(email: String) {
        self.emailTF.text = email
    }
    
    func setPassword(password: String) {
        self.passwordTF.text = password
    }
    
    func getName() -> String {
        return self.nameTF.text ?? ""
    }
    
    func getPhoneNumber() -> String {
        return self.phoneNumTF.text ?? ""
    }
    
    func getCity() -> String {
        return self.cityLabel.text ?? ""
    }
    
    func getEmai() -> String {
        return self.emailTF.text ?? ""
    }
    
    func getPassword() -> String {
        return passwordTF.text ?? ""
    }
    
    func acceptTerms() -> Bool {
        return self.checkBox.on
    }
    
    func pushViewController() {
        let vc = VerficationCodeVC(nibName: "VerficationCodeVC", bundle: nil)
        vc.isDoctor = false
        self.present(vc, animated: true, completion: nil)
    }
}
