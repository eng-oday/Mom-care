//
//  ExtraWeight+Extension.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//


import UIKit

extension ExtraWeightVC : UITableViewDataSource{
    
    func setupTableView(tableView : UITableView){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cell: ExtraFoodTVCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tipsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraFoodTVCell", for: indexPath) as? ExtraFoodTVCell{
            cell.foodImage.image = UIImage(named: self.tipsImagesArr[indexPath.row])
            cell.tipLbl.text = self.tipsArr[indexPath.row]
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ExtraWeightVC : UITableViewDelegate{}

