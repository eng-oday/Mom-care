//
//  PregnantNutrition+Extensions.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension PregenantNutritionVC : UICollectionViewDataSource {
    
    func setupCollectionView(){
        self.pregnantNutritionCollView.dataSource = self
        self.pregnantNutritionCollView.delegate = self
        pregnantNutritionCollView.registerCell(cell: NutritionNeededCVCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pregnantNutritionNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NutritionNeededCVCell", for: indexPath) as! NutritionNeededCVCell
        //"Nutrition Needed","Eating recipes","Extra Weight"
        switch indexPath.item {
        case 0:
            cell.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.6705882353, blue: 0.2078431373, alpha: 1)
            cell.shadowDecorate(color: #colorLiteral(red: 0.9490196078, green: 0.6705882353, blue: 0.2078431373, alpha: 1))
        case 1:
            cell.backgroundColor = UIColor(red: 242, green: 171, blue: 53)
            cell.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1)
            cell.shadowDecorate(color: #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1))
        case 2:
            cell.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.07058823529, alpha: 1)
            cell.shadowDecorate(color: #colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.07058823529, alpha: 1))
            
        default:
            break
        }
        cell.nutritionInage.image = UIImage(named:self.pregnantNutritionImages[indexPath.row])
        cell.nutritionTitle.text = self.pregnantNutritionNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        return CGSize(width: bounds.width/3.5, height: 120)
    }
    
}

extension PregenantNutritionVC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 1.0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //Horizental Spacing
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //Vertical Spacing
        return 10
    }
}

extension PregenantNutritionVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //["Nutrition Needed","Food Recipes","Extra Weight"]
        if indexPath.item == 0 {
            let vc = NutritionNeededVC(nibName: "NutritionNeededVC", bundle: nil)
            vc.nutritionLbl = "التغذيه المطلوبه"
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.item == 1{
            let vc = FoodRecipesVC(nibName: "FoodRecipesVC", bundle: nil)
            vc.titleName = "تناول الوصفات"
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = ExtraWeightVC(nibName: "ExtraWeightVC", bundle: nil)
            vc.titleName = "وزن زائد"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

