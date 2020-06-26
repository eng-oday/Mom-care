//
//  ChangeLanguageVC.swift
//  MomCare
//
//  Created by Eissa on 5/10/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ChangeLanguageVC: UIViewController {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var dropDown: UIButton!
    @IBOutlet weak var languageView: RoundedCornerView!
    
    let paragraphStyle = NSMutableParagraphStyle()
    @objc func actionPickerDone() {}
    @objc func actionPickerCancel() {}
    
    var langArray = ["english", "arabic"]
    let lang = Language.currentLanguage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        paragraphStyle.alignment = .center
        checkLanguageTitle()
        tapGesture()
    }
    
    // Mark: - func of check current language
    func checkLanguageTitle() {
        
        if lang == "ar" {
            self.languageLabel.text = "عربي"
        }
        else {
            self.languageLabel.text = "english"
        }
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
      
        let langTapGesture = UITapGestureRecognizer(target: self, action: #selector(changeLanguage))
        self.languageView.addGestureRecognizer(langTapGesture)
    }

    // Mark: - func of choose diseases
       @objc func changeLanguage() {
           
           let pick = ActionSheetStringPicker(title: "Languages", rows: langArray, initialSelection: 0, doneBlock: { picker, indexes, values in
               print(indexes)
               print(values!)
               
               let langChoosen = self.langArray[indexes]
               self.languageLabel.text = langChoosen
            //   self.languageLabel.textColor = .black
               
            switch indexes {
            case 0:
                Language.setAppLanguage(lang: "en")
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.restartApp()
            case 1:
                Language.setAppLanguage(lang: "ar")
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.restartApp()
            default:
                print("done")
            }
            
           }, cancel: { ActionMultipleStringCancelBlock in return }, origin: languageView)
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
}
