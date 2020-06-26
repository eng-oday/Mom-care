//
//  ShowImageVC.swift
//  MomCare
//
//  Created by Eissa on 4/25/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class ShowImageVC: UIViewController {

    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var dismissMyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPhotoView))
        self.dismissMyView.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissPhotoView() {
        self.dismiss(animated: true, completion: nil)
    }
}
