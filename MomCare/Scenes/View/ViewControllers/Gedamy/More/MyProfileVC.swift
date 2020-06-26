//
//  MyProfileVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/18/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class MyProfileVC: UIViewController {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var userNameTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var saveBu: LocalizableButton!
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var mobileTxtField: SkyFloatingLabelTextField!
    
    let paragraphStyle = NSMutableParagraphStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTextFieldData(state: false)
        self.saveBu.layer.cornerRadius = 15.0
        self.navigationController?.isNavigationBarHidden = true
        paragraphStyle.alignment = .center
        imageProfile.layer.cornerRadius = 10.0
    }
    
    func checkNameText() {
        guard let name = userNameTxtField.text, !name.isEmpty else {
            userNameTxtField.shake()
            userNameTxtField.errorMessage = "enter your username"
          return
        }
    }
    func checkEmailText() {
        guard let name = emailTxtField.text, !name.isEmpty else {
            emailTxtField.shake()
            emailTxtField.errorMessage = "enter your e-mail"
          return
        }
    }
    func checkPasswordText() {
        guard let name = passwordTxtField.text, !name.isEmpty else {
            passwordTxtField.shake()
            passwordTxtField.errorMessage = "enter your password"
          return
        }
    }
    func checkMobileText() {
        guard let name = mobileTxtField.text, !name.isEmpty else {
            mobileTxtField.shake()
            mobileTxtField.errorMessage = "enter your mobile number"
          return
        }
    }
    
    func setTextFieldData(state : Bool) {
        self.userNameTxtField.isUserInteractionEnabled = state
        self.emailTxtField.isUserInteractionEnabled = state
        self.mobileTxtField.isUserInteractionEnabled = state
        self.passwordTxtField.isUserInteractionEnabled = state
    }
    

    @IBAction func editImageProfileBuTapped(_ sender: UIButton) {
        self.handleChangePhoto()
    }
    
    @IBAction func editUserNameBuTapped(_ sender: UIButton) {
        self.userNameTxtField.isUserInteractionEnabled = true
    }
    
    @IBAction func saveBuTapped(_ sender: LocalizableButton) {
        self.setTextFieldData(state: false)
        self.handlePushSegue(viewController: MoreVC.self)
    }
    
    @IBAction func editMobileBuTapped(_ sender: UIButton) {
        self.mobileTxtField.isUserInteractionEnabled = true
    }
    
    @IBAction func editEmailBuTapped(_ sender: UIButton) {
        self.emailTxtField.isUserInteractionEnabled = true
    }
    
    @IBAction func editPasswordBuTapped(_ sender: UIButton) {
        self.passwordTxtField.isUserInteractionEnabled = true
    }
    
    @IBAction func backBuTapped(_ sender: Any) {
        self.handlePushSegue(viewController: MoreVC.self)
    }
    
    
}

extension MyProfileVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            self.imageProfile.image = image
        }else{
            self.showAlert(title: "Error", message: "error in editing image", okAction: "Try Again!!")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func handleChangePhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }else{
                self.showAlert(title: "Oh😊😊No", message: "sorry 🙏, camera not available", okAction: "Ok")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
}
