//
//  DrProfileVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/28/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class DrProfileVC: UIViewController {
    
    @IBOutlet weak var bootomContentView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var myDeatailsBu: LocalizableButton!
    @IBOutlet weak var moreBu: LocalizableButton!
    @IBOutlet weak var changeProfileImg: LocalizableButton!
    @IBOutlet weak var facebookLabel: UILabel!
    @IBOutlet weak var phoneLblTapped: UILabel!
    @IBOutlet weak var whatsAppLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.isNavigationBarHidden = true
        self.profileImg.layer.cornerRadius = 25.0
        self.myDeatailsBu.set(image: UIImage(named: "doctor-3.png"), title: "بياناتي", titlePosition: .bottom, additionalSpacing: -10.0, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        self.moreBu.set(image: UIImage(named: "iconfinder_more_126574-3.png"), title: "المزيد", titlePosition: .bottom, additionalSpacing: -8.0, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        self.bootomContentView.addShadow(location: .top, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), opacity: 0.2, radius: 5.0)
        
        let facebookTap = UITapGestureRecognizer(target: self, action: #selector(facebookDidTapped(sender:)))
        facebookLabel.isUserInteractionEnabled = true
        facebookLabel.addGestureRecognizer(facebookTap)
        
        let callTap = UITapGestureRecognizer(target: self, action: #selector(makeCall(sender:)))
        phoneLblTapped.isUserInteractionEnabled = true
        phoneLblTapped.addGestureRecognizer(callTap)
        
        let whatsappTap = UITapGestureRecognizer(target: self, action: #selector(openWhatsapp(sender:)))
        whatsAppLbl.isUserInteractionEnabled = true
        whatsAppLbl.addGestureRecognizer(whatsappTap)
    }
    
    @IBAction func moreBuTapped(_ sender: LocalizableButton) {
        let vc = MoreDrVC(nibName: "MoreDrVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
    
    @IBAction func editDateBuTapped(_ sender: LocalizableButton) {
        self.handlePresentSegue(viewController: SaveDrDetailsVC.self)
    }
    
    @IBAction func changeProfileImgBuTapped(_ sender: LocalizableButton) {
        self.handleChangePhoto()
    }
    
    @objc func makeCall(sender: UITapGestureRecognizer){
        guard let phoneTxt = self.phoneLblTapped.text else { return}
        if let phoneCallURL:URL = URL(string: "tel:\(phoneTxt)") {
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(phoneCallURL)) {
                    let alertController = UIAlertController(title: "MyApp", message: "Are you sure you want to call \n\(phoneTxt)?", preferredStyle: .alert)
                    let yesPressed = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                        application.open(phoneCallURL)
                    })
                    let noPressed = UIAlertAction(title: "No", style: .default, handler: { (action) in
                        print("nooo")
                    })
                    alertController.addAction(yesPressed)
                    alertController.addAction(noPressed)
                    present(alertController, animated: true, completion: nil)
                }
            }
    }
    
    @objc func openWhatsapp(sender: UITapGestureRecognizer){
        let urlWhats = "whatsapp://send?phone=(+201021577475)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL){
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(whatsappURL)
                    }
                }
                else {
                    self.showAlert(title: "Message", message: "Whatsapp not found", okAction: "download") { (action) in
                        guard let url = URL(string: "https://apps.apple.com/us/app/whatsapp-messenger/id310633997") else {
                            return
                        }
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }
            }
        }
    }
   
    @objc func facebookDidTapped(sender: UITapGestureRecognizer) {
       // self.setUrl(url: "https://www.apple.com")
        guard let url = URL(string: "https://www.apple.com") else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

