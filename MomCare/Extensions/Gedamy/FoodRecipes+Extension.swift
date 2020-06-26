//
//  FoodRecipes+Extension.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension FoodRecipesVC : UITableViewDataSource{
    
    func setupTableView(tableView : UITableView){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cell: FoodTVCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTVCell", for: indexPath) as? FoodTVCell{
            cell.foodPeriod.text = "٣٠ ذقيقه"
            cell.foodTitle.text = "طعام صحي"
            cell.imageFood.image = UIImage(named: "foodRecipes")
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension FoodRecipesVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GoodFoodVC(nibName: "GoodFoodVC", bundle: nil)
        vc.titleName = "طعام صحي"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
