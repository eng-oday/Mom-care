//
//  BabyNutritionVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension BabyNutritionVC : UICollectionViewDataSource {
    
    func setupCollectionView(){
        self.babyNutrionCollView.dataSource = self
        self.babyNutrionCollView.delegate = self
        babyNutrionCollView.registerCell(cell: PregnancySupplementCVCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.guideArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PregnancySupplementCVCell", for: indexPath) as! PregnancySupplementCVCell
        //"Child Nutrition Guide", "Industrial breastfeeding", "Breastfeeding" ," Does your baby have enough amount of sleep"
        switch indexPath.item {
        case 0:
            cell.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.6705882353, blue: 0.2078431373, alpha: 1)
            cell.shadowDecorate(color: #colorLiteral(red: 0.9490196078, green: 0.6705882353, blue: 0.2078431373, alpha: 1))
        case 1:
            cell.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1)
            cell.shadowDecorate(color: #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1))

        case 2:
            cell.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.07058823529, alpha: 1)
            cell.shadowDecorate(color: #colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.07058823529, alpha: 1))
        case 3:
            cell.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1)
            cell.shadowDecorate(color: #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1))
            
        default:
            break
        }
        cell.nutritionTitle.text = self.guideArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        return CGSize(width: bounds.width/3.5, height: 100)
    }
    
}

extension BabyNutritionVC : UICollectionViewDelegateFlowLayout{
    
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

extension BabyNutritionVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //["Nutrition Needed","Food Recipes","Extra Weight"]
        let vc = ChildNutritionGuideVC(nibName: "ChildNutritionGuideVC", bundle: nil)
        vc.nutritionLbl = self.guideArr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

