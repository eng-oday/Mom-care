//
//  LoginVC.swift
//  MomCare
//
//  Created by Eissa on 4/2/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import MIAlertController
import PopupDialog
import SwiftEntryKit

protocol UserLoginProtocol: class {
    
    func setEmail(email: String)
    func setPassword(paswword: String)
    func getEmail() -> String
    func getPassword() -> String
    func pushViewController()
}

class LoginVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var showPassword: UIButton!

    var updateLoginPresenter: UpdateLoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.logoImg.image = UIImage(named: "OBJECTS-1")
        self.showPassword.setBackgroundImage(UIImage(named: "unhidden"), for: .normal)
        updateLoginPresenter = UpdateLoginPresenter(updateUserLoginProtocol: self)
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
                self.showPassword.setBackgroundImage(UIImage(named: "unhidden"), for: .normal)
            }
        }
        else {
            Alert.showErrorAlert(title: "Nothing to show please enter password\n", body: "")
        }
    }

    @IBAction func loginBtn(_ sender: Any) {
        self.updateLoginPresenter.loginBtn()
    }
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
        
        // go to forgot password screen
        let vc = ForgotPasswordVC(nibName: "ForgotPasswordVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func doctorBtn(_ sender: Any) {
        
        // go to doctor register screen
        let vc = DoctorRegisterVC(nibName: "DoctorRegisterVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func newAccountBtn(_ sender: Any) {
        
        // go to create new account
        let vc = MotherRegisterVC(nibName: "MotherRegisterVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func showPasswordBtn(_ sender: Any) {
        showUserPassword()
    }
}

// Mark: - adapt this class to protocol and handle the protocol's functions
extension LoginVC: UserLoginProtocol {

    func setEmail(email: String) {
        self.emailTF.text = email
    }
    
    func setPassword(paswword: String) {
        self.passwordTF.text = paswword
    }
    
    func getEmail() -> String {
        return emailTF.text ?? ""
    }
    
    func getPassword() -> String {
        return passwordTF.text ?? ""
    }
    
    func pushViewController() {
        let vc = TabBarController(nibName: "TabBarController", bundle: nil)
        vc.selectedIndex = 2
        self.view.window?.rootViewController = vc
    }
}
