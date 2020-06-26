//
//  BabySleepVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension BabySleepVC : UITableViewDataSource{
    
    func setupTableView(tableView : UITableView){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cell: BabySleepTVCell.self)
        tableView.separatorColor = UIColor.clear
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.childbirthArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BabySleepTVCell", for: indexPath) as? BabySleepTVCell{
            cell.headerLbl.text = self.childbirthArr[indexPath.row]
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}

extension BabySleepVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChildPeriodVC(nibName: "ChildPeriodVC", bundle: nil)
        vc.titleName = self.childbirthArr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

