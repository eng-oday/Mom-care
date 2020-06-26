//
//  CheckVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension CheckVC : UITableViewDataSource{
    func setupTableView(tableView : UITableView){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cell: AllChecksTVCell.self)
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.selectedSementControl.selectedSegmentIndex == 0 {
            return selectedUnselectedImg.count
        }else if self.selectedSementControl.selectedSegmentIndex == 1 {
            return unSelctedImg.count
        }else{
            return selctedImg.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AllChecksTVCell", for: indexPath) as? AllChecksTVCell{
            switch self.selectedSementControl.selectedSegmentIndex {
            case 0:
                cell.selectImgA.image = UIImage(named: "\(self.selectedUnselectedImg[indexPath.row])")
            case 1:
                cell.selectImgA.image = UIImage(named: "\(self.unSelctedImg[indexPath.row])")
            case 2:
                cell.selectImgA.image = UIImage(named: "\(self.selctedImg[indexPath.row])")
            default:
                break
            }
           return cell
        }else{
            return UITableViewCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension CheckVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PregnancyTestVC(nibName: "PregnancyTestVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


