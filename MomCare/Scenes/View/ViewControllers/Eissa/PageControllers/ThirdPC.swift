//
//  ThirdPC.swift
//  MomCare
//
//  Created by Eissa on 3/30/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class ThirdPC: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    
      var pager = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.logoImage.image = UIImage(named: "On-Boarding-3")
    }

    @IBAction func skipBtn(_ sender: Any) {
        
        // go to login screen
        let vc = LoginVC(nibName: "LoginVC", bundle: nil)
        self.view.window?.rootViewController = vc
       // self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        // go to next page controller
        self.pager.goToNextPage(animated: true)
        let pageControllerr = self.parent as! PagerController
        pageControllerr.pageControl.currentPage = 3
    }
    
    @IBAction func prevBtn(_ sender: Any) {
        
        // go back to prev page controller
        self.pager.goToPreviousPage(animated: true)
        let pageControllerr = self.parent as! PagerController
        pageControllerr.pageControl.currentPage = 1
    }
}
