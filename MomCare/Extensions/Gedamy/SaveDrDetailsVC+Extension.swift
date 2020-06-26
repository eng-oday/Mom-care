//
//  SaveDrDetailsVC+Extension.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 5/16/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension SaveDrDetailsVC {
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
