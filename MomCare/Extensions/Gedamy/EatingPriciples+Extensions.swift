//
//  EatingPrinciplesVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension EatingPrinciplesVC : UITableViewDataSource{
    func setupTableView(tableView : UITableView){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cell: SafeTVCell.self)
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.saftySementControl.selectedSegmentIndex == 0 {
            return self.safeFoodArr.count
        }else if self.saftySementControl.selectedSegmentIndex == 1 {
            return self.unsafeFoodArr.count
        }else{
            return self.unsafeFoodArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SafeTVCell", for: indexPath) as? SafeTVCell{
            switch self.saftySementControl.selectedSegmentIndex {
            case 0:
                cell.saftyImageType.image = UIImage(named: self.safeImgArr[indexPath.row])
                cell.titleLbl.text = self.safeFoodArr[indexPath.row]
            case 1:
                cell.saftyImageType.image = UIImage(named: self.unsafeImgArr[indexPath.row])
                cell.titleLbl.text = self.unsafeFoodArr[indexPath.row]
            case 2:
                cell.saftyImageType.image = UIImage(named: self.unsafeImgArr[indexPath.row])
                cell.titleLbl.text = self.unsafeFoodArr[indexPath.row]
            default:
                break
            }
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension EatingPrinciplesVC : UITableViewDelegate{}
