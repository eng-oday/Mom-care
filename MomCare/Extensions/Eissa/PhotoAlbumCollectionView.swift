//
//  PhotoAlbumCollectionView.swift
//  MomCare
//
//  Created by Eissa on 4/22/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension PhotoAlbumVC: UICollectionViewDataSource {

    func setupCollectionView(collectionView: UICollectionView)  {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoAlbumCell", for: indexPath) as? PhotoAlbumCell {
            
            cell.imageCell.image = imagesArray[indexPath.row]
            cell.monthLabel.text = titleArray[indexPath.row]
            return cell
        }
        else {
            return PhotoAlbumCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = MyPhotosVC(nibName: "MyPhotosVC", bundle: nil)
     //   vc.titleLabel.text = 
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
}

extension PhotoAlbumVC: UICollectionViewDelegate {
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (UIScreen.main.bounds.width - 35) / 2, height: 200)
    }
}

extension PhotoAlbumVC : UICollectionViewDelegateFlowLayout{

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: CGFloat(0), left: CGFloat(0), bottom: CGFloat(0), right: CGFloat(0))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
    }
}
