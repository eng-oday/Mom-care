//
//  ExaminationsTableCell.swift
//  MomCare
//
//  Created by Eissa on 4/15/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class ExaminationsTableCell: UITableViewCell {
    
    @IBOutlet weak var examinationName: UILabel!
    @IBOutlet weak var doneExamination: UIButton!
    @IBOutlet weak var addAlert: UIButton!
    @IBOutlet weak var addAlertView: UIView!
    @IBOutlet weak var addAlertLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        doneExamination.setBackgroundImage(UIImage(named: "correct-1"), for: .normal)
        addAlert.setBackgroundImage(UIImage(named: "correct-4"), for: .normal)
        addTapGseture()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addTapGseture() {
        let tapAlert = UITapGestureRecognizer(target: self, action: #selector(addAlertBtn))
        self.addAlertView.addGestureRecognizer(tapAlert)
    }
    
    @IBAction func doneExaminationBtn(_ sender: Any) {
         
        doneExamination.setBackgroundImage(UIImage(named: "correct-3"), for: .normal)
    }
    
    @IBAction func addAlertBtn(_ sender: Any) {
        
        addAlert.setBackgroundImage(UIImage(named: "correct"), for: .normal)
        addAlertLabel.textColor = UIColor.init(red: 0, green: 191, blue: 43)
    }
}
