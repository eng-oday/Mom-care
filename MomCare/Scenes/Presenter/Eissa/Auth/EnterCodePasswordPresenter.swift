//
//  EnterCodePasswordPresenter.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

class EnterCodePasswordPresenter {
    
    weak var enterCodePrt: EnterCodeProtocol!
   
    init(enterCode: EnterCodeProtocol) {
        
        self.enterCodePrt = enterCode
    }
    
    // Mark: - func of validating inputs
    func validateInputs(code: String) -> AuthErrors? {

        guard !code.isEmpty else {
            return .verficationCode
        }
        return nil
    }
    
    // Mark: - func of send verfication code
    func sendCode() {
        
        // IS FAIL
        if let error = validateInputs(code: enterCodePrt.getCode()) {
            
            Alert.showErrorAlert(title: "\(error.errorDescription)\n", body: "")
        }
        else {
            // IS SUCCESS ... send code request
            enterCodePrt.pushViewController()
        }
    }
}
