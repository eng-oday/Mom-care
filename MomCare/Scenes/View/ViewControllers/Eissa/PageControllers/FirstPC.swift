//
//  StartVC.swift
//  MomCare
//
//  Created by Eissa on 3/28/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class FirstPC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
 
     var pager = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.logoImg.image = UIImage(named: "mother")
    }

    @IBAction func skipBtn(_ sender: Any) {
        
        // go to login screen
        let vc = LoginVC(nibName: "LoginVC", bundle: nil)
        self.view.window?.rootViewController = vc
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        // go to next page controller
        self.pager.goToNextPage(animated: true)
        let pageControllerr = self.parent as! PagerController
        pageControllerr.pageControl.currentPage = 1
        
    }
}
