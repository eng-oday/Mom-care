//
//  AddPhotoCollectionView.swift
//  MomCare
//
//  Created by Eissa on 4/26/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension AddPhotoVCViewController: UICollectionViewDataSource {

    func setupCollectionView(collectionView: UICollectionView)  {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddPhotoCell", for: indexPath) as? AddPhotoCell {
            
            cell.shadowDecorate(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            cell.imageCell.image = images[indexPath.row].img
            cell.deleteAction = {
                self.images.remove(at: indexPath.row)
                collectionView.reloadData()
                self.saveImages()
            }
            return cell
        }
        else {
            return AddPhotoCell()
        }
    }
}

extension AddPhotoVCViewController: UICollectionViewDelegate {
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (UIScreen.main.bounds.width - 45) / 2, height: 150)
    }
}

extension AddPhotoVCViewController : UICollectionViewDelegateFlowLayout{

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: CGFloat(0), left: CGFloat(0), bottom: CGFloat(0), right: CGFloat(0))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 15
    }
}

  
