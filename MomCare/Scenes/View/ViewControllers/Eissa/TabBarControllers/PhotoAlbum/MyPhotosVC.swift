//
//  MyPhotosVC.swift
//  MomCare
//
//  Created by Eissa on 4/24/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class MyPhotosVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var PhotosCollectionView: UICollectionView!
    
    fileprivate let CollectionCellId = "MyPhotosCell"
    let CollectionCell = UINib(nibName: "MyPhotosCell", bundle: nil)
    
    var weekArray = ["First weak", "Second weak", "Third weak","Fourth weak", "First weak", "Second weak", "Third weak", "Fourth weak", "First weak", "Second weak"]
    var imagesArray = [UIImage(named: "2018_2_24_14_19_22_952-1"), UIImage(named: "Nutrition-Articles---Mother-to-be"), UIImage(named: "Eating-for-a-healthy-pregnancy-resized"), UIImage(named: "2018_2_24_14_19_22_952-1"), UIImage(named: "2018_2_24_14_19_22_952-1"), UIImage(named: "Nutrition-Articles---Mother-to-be"), UIImage(named: "Eating-for-a-healthy-pregnancy-resized"), UIImage(named: "2018_2_24_14_19_22_952-1"), UIImage(named: "2018_2_24_14_19_22_952-1"), UIImage(named: "Nutrition-Articles---Mother-to-be")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.back.setBackgroundImage(UIImage(named: "arrow_pointt"), for: .normal)
        PhotosCollectionView.register(CollectionCell, forCellWithReuseIdentifier: CollectionCellId)
        setupCollectionView(collectionView: PhotosCollectionView)

    }

    @IBAction func backBtn(_ sender: Any) {
       let vc = TabBarController(nibName: "TabBarController", bundle: nil)
        vc.selectedIndex = 3
       self.navigationController?.pushViewController(vc, animated: true)
    }
}
