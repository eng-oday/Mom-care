//
//  EnterCodePasswordVC.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import CountdownLabel

protocol EnterCodeProtocol: class {
    
    func setCode(code: String)
    func getCode() -> String
    func pushViewController()
}

class EnterCodePasswordVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var verficationCodeTF: UITextField!
    @IBOutlet weak var nextView: CircleView!
    @IBOutlet weak var nextImg: UIImageView!
    @IBOutlet weak var previousView: CircleView!
    @IBOutlet weak var previousImg: UIImageView!
    @IBOutlet weak var countCodeLabel: CountdownLabel!
    
    var enterCodePresenter: EnterCodePasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.logoImg.image = UIImage(named: "OBJECTS-1")
        self.nextImg.image = UIImage(named: "arrow_pointt")
        self.previousImg.image = UIImage(named: "arrow_pointt")
        enterCodePresenter = EnterCodePasswordPresenter(enterCode: self)
        tapGesture()
        handleCountLabel()
    }
    
    // Mark: - handle countdownlabel
    func handleCountLabel() {
        
        self.countCodeLabel.setCountDownTime(minutes: 60)
        self.countCodeLabel.animationType = .Fall
        self.countCodeLabel.start()
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
        self.enterCodePresenter.sendCode()
    }
    
    // Mark: - func of go back to previous screen
    @objc func goToBeforePag() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resendCode(_ sender: Any) {
        
        // do resend request
        handleCountLabel() // after success of resending code request
    }
}

// Mark: - adapt this class to the protocol and handle the protocol's functions
extension EnterCodePasswordVC: EnterCodeProtocol {

    func setCode(code: String) {
        self.verficationCodeTF.text = code
    }
    
    func getCode() -> String {
        return self.verficationCodeTF.text ?? ""
    }
    
    func pushViewController() {
        let vc = SetNewPasswordVC(nibName: "SetNewPasswordVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
