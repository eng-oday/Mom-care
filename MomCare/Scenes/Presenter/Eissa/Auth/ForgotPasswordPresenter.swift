//
//  ForgotPasswordPresenter.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

class ForgotPasswordPresenter {
    
    weak var forgotPasswordPrt: ForgotPasswordProtocol!
    
    init(forgotPassword: ForgotPasswordProtocol) {
        
        self.forgotPasswordPrt = forgotPassword
    }
    
    // Mark: - func of validating inputs
    func validateInputs(phoneNumber: String) -> AuthErrors? {
        
        guard !phoneNumber.isEmpty else {
            
            return .emptyPhoneNumber
        }
        guard phoneNumber.count >= 9 else {
            return .invalidPhoneNumber
        }
        return nil
    }
    
    // func of send phoneNumber
    func sendPhoneNumber() {
        
        // IF FAIL
        if let error = validateInputs(phoneNumber: forgotPasswordPrt.getPhoneNumber()) {
            
            Alert.showErrorAlert(title: "\(error.errorDescription)\n", body: "")
        }
        else {
            // IF SUCCESS ... do request
            forgotPasswordPrt.pushViewController()
        }
    }
}
