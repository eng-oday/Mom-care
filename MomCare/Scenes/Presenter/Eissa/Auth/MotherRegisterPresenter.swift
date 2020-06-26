//
//  MotherRegisterPresenter.swift
//  MomCare
//
//  Created by Eissa on 4/3/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

class MotherRegisterPresenter {
    
    weak var motherRegisterPtr: MotherRegisterProtocol!
    
    init(motherRegister: MotherRegisterProtocol) {
        
        self.motherRegisterPtr = motherRegister
    }
    
    // Mark: - func of validating inputs
    func validateInputs(name: String, phoneNumber: String, email: String, password: String, diseaseType: String, termsAccepted: Bool) -> AuthErrors? {
        
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
        if let error = validateInputs(name: motherRegisterPtr.getName(), phoneNumber: motherRegisterPtr.getPhoneNumber(), email: motherRegisterPtr.getEmail(), password: motherRegisterPtr.getPassword(), diseaseType: motherRegisterPtr.getDiseasesType(), termsAccepted: motherRegisterPtr.acceptTerms()) {
            
            Alert.showErrorAlert(title: "Error", body: error.errorDescription)
        }
        else {
            
            // IF SUCCESS ... do register request
            self.motherRegisterPtr.pushViewController()
        }
    }
}
