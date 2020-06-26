//
//  DoctorRegisterPresenter.swift
//  MomCare
//
//  Created by Eissa on 4/3/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

class DoctorRegisterPresenter {

     weak var doctorRegisterPrt: DoctorRegisterProtocol!
    
    init(doctorRegister: DoctorRegisterProtocol) {
        
        self.doctorRegisterPrt = doctorRegister
    }
    
    // Mark: - func of validation inputs
    func validateInputs(name: String, phoneNumber: String, email: String, password: String, city: String, termsAccepted: Bool) -> AuthErrors? {
        
        guard !name.isEmpty else {
            return .emptyName
        }
        guard !phoneNumber.isEmpty else {
            return .emptyPhoneNumber
        }
        guard !email.isEmpty else {
            return .emptyEmail
        }
        guard !password.isEmpty else {
            return .emptyPassword
        }
        guard city != "city" else {
            return .emptyCity
        }
        guard validateEmail(email: email) else {
            return .invalidEmail
        }
        guard phoneNumber.count >= 9 else {
            return .invalidPhoneNumber
        }
        guard password.count >= 6 else {
            return .strongPasswprd
        }
        guard termsAccepted == true else {
            return .acceptTerms
        }
        return nil
    }
  
    // Mark: - func of valid mobile number
       func validateEmail(email: String) -> Bool {
           let regex = "([\\w-+]+(?:\\.[\\w-+]+)*@(?:[\\w-]+\\.)+[a-zA-Z]{2,7})"
           let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
           return emailTest.evaluate(with: email)
       }
    
    // Mark: - func of register action
    func registerBtn() {
        
        // IF FAIL
        if let error = validateInputs(name: doctorRegisterPrt.getName(), phoneNumber: doctorRegisterPrt.getPhoneNumber(), email: doctorRegisterPrt.getEmai(), password: doctorRegisterPrt.getPassword(), city: doctorRegisterPrt.getCity(), termsAccepted: doctorRegisterPrt.acceptTerms()) {
            
            Alert.showErrorAlert(title: "\(error.errorDescription)\n", body: "")
        }
        else {
            
            // IF SUCCESS ...do register request
            self.doctorRegisterPrt.pushViewController()
        }
    }
}
