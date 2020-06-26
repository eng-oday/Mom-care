//
//  PregnancySupplementVC+Extensions.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/1/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import UIKit


extension PregnancySupplementVC : UICollectionViewDataSource{
    
    func setupCollectionView(){
        self.pregnancySupplementCollView.dataSource = self
        self.pregnancySupplementCollView.delegate = self
        pregnancySupplementCollView.registerCell(cell: PregnancySupplementCVCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(PregnancySupplementPresenter.shared.getNutritionNeededCellCount())
        return PregnancySupplementPresenter.shared.getNutritionNeededCellCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PregnancySupplementCVCell", for: indexPath) as? PregnancySupplementCVCell{
        cell.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1)
        cell.shadowDecorate(color: #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1))
            cell.nutritionTitle.text = PregnancySupplementPresenter.shared.nutrionNameArr[indexPath.row]
        return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        return CGSize(width: bounds.width/3.5, height: 100)
    }
    
}

extension PregnancySupplementVC : UICollectionViewDelegateFlowLayout{
    
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

extension PregnancySupplementVC : UICollectionViewDelegate {
    
}










