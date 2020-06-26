//
//  MyBabyVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/18/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ActionSheetPicker_3_0

class MyBabyVC: UIViewController {

    @IBOutlet weak var editImage: RoundedButton!
    @IBOutlet weak var imageView: CircleView!
    @IBOutlet weak var babyImage: UIImageView!
    @IBOutlet weak var childNameTF: SkyFloatingLabelTextField!
    @IBOutlet weak var dateTF: SkyFloatingLabelTextField!
    @IBOutlet weak var genderTF: SkyFloatingLabelTextField!
    @IBOutlet weak var editDate: UIButton!
    @IBOutlet weak var editGender: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var editName: UIButton!
    
    let paragraphStyle = NSMutableParagraphStyle()
    @objc func actionPickerDone() {}
    @objc func actionPickerCancel() {}
    
    var genderArray = ["Male", "Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.editName.setBackgroundImage(UIImage(named: "edit-1"), for: .normal)
        self.editDate.setBackgroundImage(UIImage(named: "edit-1"), for: .normal)
        self.editGender.setBackgroundImage(UIImage(named: "edit-1"), for: .normal)
        childNameTF.isEnabled = false
        dateTF.isEnabled = false
        genderTF.isEnabled = false
        paragraphStyle.alignment = .center
        tapGesture()
    }

    // Mark: - func of UITapGesture of view
    func tapGesture() {
      
        let dateTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectdate))
        self.dateTF.addGestureRecognizer(dateTapGesture)
        
        let genderTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectGender))
        self.genderTF.addGestureRecognizer(genderTapGesture)
        
        let picTapgesture = UITapGestureRecognizer(target: self, action: #selector(openCameraOrGallery))
        self.imageView.addGestureRecognizer(picTapgesture)
    }
    
    func checkNameText() {
        guard let name = childNameTF.text, !name.isEmpty else {
            childNameTF.shake()
            childNameTF.errorMessage = "enter your child's name"
          return
        }
    }
    
    // Mark: - func of select date
       @objc func selectdate() {
           
           let datePicker = ActionSheetDatePicker(title: "Date", datePickerMode: UIDatePicker.Mode.date, selectedDate: Date(), doneBlock: {
                   picker, value, index in
                   
                   let formatter = DateFormatter()
                   formatter.dateFormat = "yyyy-MM-dd"
                   formatter.locale = Locale(identifier: "en")
                   let firstDate = formatter.string(from: value! as! Date)

                   let dateChosen = String(describing: firstDate)
                   self.dateTF.text = dateChosen
                   
                   return
               }, cancel: { ActionStringCancelBlock in return }, origin: (editDate as AnyObject).superview!?.superview)
               let secondsInWeek: TimeInterval = 7 * 24 * 60 * 60;
               datePicker?.minimumDate = Date()
               datePicker?.minuteInterval = 20
               datePicker?.locale = Locale(identifier: "en")
           
               let bar1 = UIBarButtonItem.init(title: "Confirm", style: .plain, target: self, action: #selector(actionPickerDone))
                     let bar2 = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(actionPickerCancel))
                     // Done button
                     bar1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
                     // Cancel button
                     bar2.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
                     // title of actionsheet
                     datePicker?.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any, NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
                     datePicker?.pickerBackgroundColor = UIColor.white
                     datePicker?.toolbarBackgroundColor = UIColor.white
                     datePicker?.setDoneButton(bar1)
                     datePicker?.setCancelButton(bar2)
                     // elements in action sheet
                     datePicker?.pickerTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any,NSAttributedString.Key.paragraphStyle: paragraphStyle,NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
               datePicker?.show()
       }
       
       // Mark: - func of select gender
       @objc func selectGender() {
           
           let pick = ActionSheetStringPicker(title: "Gender", rows: genderArray, initialSelection: 0, doneBlock: { picker, indexes, values in
               print(indexes)
               print(values!)
               
               let gender = self.genderArray[indexes]
               self.genderTF.text = gender
               
           }, cancel: { ActionMultipleStringCancelBlock in return }, origin: editGender)
           let bar1 = UIBarButtonItem.init(title: "Confirm", style: .plain, target: self, action: #selector(actionPickerDone))
           let bar2 = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(actionPickerCancel))
           // Done button
           bar1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
           // Cancel button
           bar2.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
           // title of actionsheet
           pick?.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any, NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
           pick?.pickerBackgroundColor = UIColor.white
           pick?.toolbarBackgroundColor = UIColor.white
           pick?.setDoneButton(bar1)
           pick?.setCancelButton(bar2)
           // elements in action sheet
           pick?.pickerTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any,NSAttributedString.Key.paragraphStyle: paragraphStyle,NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
           pick?.show()
       }

    // Mark: - open camera
    @objc func openCameraOrGallery() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Attach Photo", message: "choose a photo", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                //show alert
                let alert = UIAlertController(title: "Camera does not work", message: "Restart Your App", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("No camera")
            }
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Open photo library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func editNameBtn(_ sender: Any) {
        childNameTF.isEnabled = true
    }
    
    @IBAction func editDateBtn(_ sender: Any) {
        dateTF.isEnabled = true
        selectdate()
    }
    
    @IBAction func editGenderBtn(_ sender: Any) {
        genderTF.isEnabled = true
        selectGender()
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if childNameTF.text?.count == 0 {
            checkNameText()
        }
        else {
            childNameTF.isEnabled = false
        }
        dateTF.isEnabled = false
        genderTF.isEnabled = false
    }
    
    @IBAction func backBtn(_ sender: Any) {
        handlePushSegue(viewController: MoreVC.self)
    }
    
    @IBAction func editImageBtn(_ sender: Any) {
        openCameraOrGallery()
    }
}

extension MyBabyVC: UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let imageData: Data = image.jpegData(compressionQuality: 0.5)!
           // self.babyImage.image = image
            dismiss(animated: true, completion: nil)
        }
        else if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            let imageData: Data = image.jpegData(compressionQuality: 0.5)!
            self.babyImage.image = image
            dismiss(animated: true, completion: nil)
        }
    }
}
