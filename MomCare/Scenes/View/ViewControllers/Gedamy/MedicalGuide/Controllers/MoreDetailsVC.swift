//
//  MoreDetailsVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/11/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class MoreDetailsVC: UIViewController {

    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var descriptionTxt: UITextView!
    @IBOutlet weak var headTitleLbl: UILabel!
    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomView.addShadow(location: .top, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), opacity: 0.2, radius: 5.0)
        self.imgProfile.image = UIImage(named: imageName)
        self.descriptionTxt.text = self.desc
        self.headTitleLbl.text = self.headTitle
        self.navigationController?.isNavigationBarHidden = true
    }
    
    var imageName = ""
    var desc = ""
    var headTitle = ""
    
    @IBAction func saveOrNotBuTapped(_ sender: UIButton) {
        
    }
    @IBAction func backBuTapped(_ sender: UIButton) {
        let vc = TabBarController(nibName: "TabBarController", bundle: nil)
        vc.selectedIndex = 4
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
