//
//  WorkDateVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import UIKit

extension WorkDatesVC {
    func handleSelectAllButton(image : String) {
        self.saturDayBu.setImage(UIImage(named: image), for: .normal)
        self.sunDayBu.setImage(UIImage(named: image), for: .normal)
        self.monDayBu.setImage(UIImage(named: image), for: .normal)
        self.thuesDayBu.setImage(UIImage(named: image), for: .normal)
        self.wendesDayBu.setImage(UIImage(named: image), for: .normal)
        self.thrusDayBu.setImage(UIImage(named: image), for: .normal)
    }
}
