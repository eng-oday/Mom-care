//
//  NutritionNeeded+Extensions.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/31/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension NutritionNeededVC : UICollectionViewDataSource {
    
    func setupCollectionView(){
        self.nutritionNeededCollView.dataSource = self
        self.nutritionNeededCollView.delegate = self
        nutritionNeededCollView.registerCell(cell: NutritionNeededCVCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NutritionNeededCVCell", for: indexPath) as! NutritionNeededCVCell
        switch indexPath.item {
        case 0:
        cell.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.07058823529, alpha: 1)
        cell.shadowDecorate(color: #colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.07058823529, alpha: 1))
        case 1:
            cell.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1)
            cell.shadowDecorate(color: #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1))
            
        default:
            break
        }
        cell.nutritionInage.image = UIImage(named: NutritionNeededVCPresenter.shared.nutritionImageArr[indexPath.row])
        cell.nutritionTitle.text = NutritionNeededVCPresenter.shared.nutrionNameArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        return CGSize(width: bounds.width/3.5, height: 120)
    }
    
}

extension NutritionNeededVC : UICollectionViewDelegateFlowLayout{
    
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

extension NutritionNeededVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let vc = PregnancySupplementVC(nibName: "PregnancySupplementVC", bundle: nil)
            vc.titleName = NutritionNeededVCPresenter.shared.nutrionNameArr[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.item == 1{
            let vc = EatingPrinciplesVC(nibName: "EatingPrinciplesVC", bundle: nil)
            vc.titleName = NutritionNeededVCPresenter.shared.nutrionNameArr[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

