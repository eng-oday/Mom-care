//
//  SavedImages+Extension.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 5/16/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension SavedVC : UITableViewDataSource{
        func setupTableView(tableView : UITableView){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cell: SavedTVCell.self)
        tableView.tableFooterView = UIView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTVCell", for: indexPath) as? SavedTVCell{
            cell.babyOrder.text = self.titleArr[indexPath.row]
            cell.profileImage.image = UIImage(named: "\(self.imagesArr[indexPath.row])")
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension SavedVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
