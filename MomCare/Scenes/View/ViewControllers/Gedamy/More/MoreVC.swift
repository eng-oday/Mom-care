//
//  MoreVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/18/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {

    @IBOutlet weak var logOutBu: LocalizableButton!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var myBabyView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var savedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logOutBu.layer.borderColor = #colorLiteral(red: 0.8813971008, green: 0.4183354528, blue: 0.4238202558, alpha: 1)
        self.logOutBu.layer.borderWidth = 1.0
        self.logOutBu.layer.cornerRadius = 20.0

        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handlesettingsViewTap(sender:)))
        settingsView.addGestureRecognizer(tapGesture1)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleprofileViewTap(sender:)))
        profileView.addGestureRecognizer(tapGesture2)
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(handlemyBabyViewTap(sender:)))
        myBabyView.addGestureRecognizer(tapGesture3)
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(handlesavedViewTap(sender:)))
        savedView.addGestureRecognizer(tapGesture4)
        
    }
    
    @IBAction func logOutBuTapped(_ sender: LocalizableButton) {
        let vc = LoginVC(nibName: "LoginVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }

    // 3. this method is called when a tap is recognized
    @objc func handlesettingsViewTap(sender: UITapGestureRecognizer) {
       // self.handlePresentSegue(viewController: SettingsVC.self)
        let vc = SettingsVC(nibName: "SettingsVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
        
    }
    
    @objc func handlemyBabyViewTap(sender: UITapGestureRecognizer) {
       // self.handlePresentSegue(viewController: SettingsVC.self)
        let vc = MyBabyVC(nibName: "MyBabyVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
    
    @objc func handleprofileViewTap(sender: UITapGestureRecognizer) {
        
        let vc = MyProfileVC(nibName: "MyProfileVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
        
    }
    
    @objc func handlesavedViewTap(sender: UITapGestureRecognizer) {
        let vc = SavedVC(nibName: "SavedVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }

}
