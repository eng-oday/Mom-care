//
//  ForgotPasswordVC.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

protocol ForgotPasswordProtocol: class {
    
    func setPhoneNumber(phoneNum: String)
    func getPhoneNumber() -> String
    func pushViewController()
}

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var nextView: CircleView!
    @IBOutlet weak var nextImg: UIImageView!
    @IBOutlet weak var previousView: CircleView!
    @IBOutlet weak var previousImg: UIImageView!
    
    var forgotPasswordPresenter: ForgotPasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.logoImg.image = UIImage(named: "OBJECTS-1")
        self.nextImg.image = UIImage(named: "arrow_pointt")
        self.previousImg.image = UIImage(named: "arrow_pointt")
        forgotPasswordPresenter = ForgotPasswordPresenter(forgotPassword: self)
        tapGesture()
    }

    // Mark: - func of UITapGesture of view
    func tapGesture() {
      
        let nextTapGesture = UITapGestureRecognizer(target: self, action: #selector(nextPage))
        self.nextView.addGestureRecognizer(nextTapGesture)
        
        let beforeTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToBeforePag))
        self.previousView.addGestureRecognizer(beforeTapGesture)
    }

    // Mark: - func of going to next page
    @objc func nextPage() {
        self.forgotPasswordPresenter.sendPhoneNumber()
    }
    
    // Mark: - func of go back to previous screen
    @objc func goToBeforePag() {
        self.dismiss(animated: true, completion: nil)
    }
}

// Mark: - adapt this class to the protocol and handle the protocol's functions
extension ForgotPasswordVC: ForgotPasswordProtocol {
    
    func setPhoneNumber(phoneNum: String) {
        self.phoneNumberTF.text = phoneNum
    }
    
    func getPhoneNumber() -> String {
        return self.phoneNumberTF.text ?? ""
    }
    
    func pushViewController() {
        let vc = EnterCodePasswordVC(nibName: "EnterCodePasswordVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
