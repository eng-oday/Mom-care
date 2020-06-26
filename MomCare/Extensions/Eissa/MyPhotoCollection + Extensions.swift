//
//  MyPhotoCollection + Extensions.swift
//  MomCare
//
//  Created by Eissa on 4/25/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension MyPhotosVC: UICollectionViewDataSource {

    func setupCollectionView(collectionView: UICollectionView)  {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPhotosCell", for: indexPath) as? MyPhotosCell {
            
            cell.weekLabel.text = weekArray[indexPath.row]
            cell.imageCell.image = imagesArray[indexPath.row]
            return cell
        }
        else {
            return MyPhotosCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let vc = ShowImageVC(nibName: "ShowImageVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
}

extension MyPhotosVC: UICollectionViewDelegate {
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (UIScreen.main.bounds.width - 35) / 2, height: 250)
    }
}

extension MyPhotosVC : UICollectionViewDelegateFlowLayout{

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: CGFloat(0), left: CGFloat(0), bottom: CGFloat(0), right: CGFloat(0))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
    }
}
