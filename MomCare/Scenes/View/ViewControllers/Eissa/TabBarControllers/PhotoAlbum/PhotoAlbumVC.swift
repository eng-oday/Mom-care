//
//  PhotoAlbumVC.swift
//  MomCare
//
//  Created by Eissa on 3/31/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class PhotoAlbumVC: UIViewController {

    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    fileprivate let CollectionCellId = "PhotoAlbumCell"
    let CollectionCell = UINib(nibName: "PhotoAlbumCell", bundle: nil)
    
    var titleArray = ["First month", "Second month", "Third month","Fourth month"]
    var imagesArray = [UIImage(named: "2018_2_24_14_19_22_952-1"), UIImage(named: "Nutrition-Articles---Mother-to-be"), UIImage(named: "Eating-for-a-healthy-pregnancy-resized"), UIImage(named: "2018_2_24_14_19_22_952-1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.add.setBackgroundImage(UIImage(named: "Plus"), for: .normal)
        setupCollectionView(collectionView: photoCollectionView)
        self.photoCollectionView.register(CollectionCell, forCellWithReuseIdentifier: CollectionCellId)

    }
    @IBAction func addBtn(_ sender: Any) {
        // add photo to album
        let vc = AddPhotoVCViewController(nibName: "AddPhotoVCViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
    
    @IBAction func editBtn(_ sender: Any) {
        // edit photo from album
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        // search a photo from album
    }
    

}
