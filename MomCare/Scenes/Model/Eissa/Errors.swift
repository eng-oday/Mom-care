//
//  Errors.swift
//  MomCare
//
//  Created by Eissa on 4/2/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

enum AuthErrors: Error {
    
    case emptyName
    case emptyPhoneNumber
    case emptyEmail
    case emptyPassword
    case invalidEmail
    case invalidPhoneNumber
    case strongPasswprd
    case emptyCity
    case acceptTerms
    case verficationCode
    case emptyConfirmPassword
    case matchPassword
    case dateMenstruation
    
    var errorDescription: String {
        
        switch self {
            
        case .emptyName:
         return "Please enter full name"
            
        case .emptyEmail:
            return "Please enter your E-mail"
            
        case .emptyPhoneNumber:
            return "Please enter phone Number"
            
        case .emptyPassword:
            return "Please enter password"
            
        case .emptyCity:
            return "Please choose city"
            
        case .invalidEmail:
            return "Please enter a valid E-mail"
            
        case .invalidPhoneNumber:
            return "Please enter a valid phone number"
            
        case .strongPasswprd:
            return "Short password"
            
        case .acceptTerms:
            return "You should accept terms amd condition"
            
        case .verficationCode:
            return "Please enter verfication code"
            
        case .emptyConfirmPassword:
            return "Please enter confirm password"
            
        case .matchPassword:
            return "Password doesn't matches"
        case .dateMenstruation:
            return "Please enter the last date of menstruation\n"
        }
    }
}
