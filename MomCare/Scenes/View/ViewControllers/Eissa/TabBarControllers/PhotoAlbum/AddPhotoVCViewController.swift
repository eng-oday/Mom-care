//
//  AddPhotoVCViewController.swift
//  MomCare
//
//  Created by Eissa on 4/24/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class AddPhotoVCViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var imageFill: UIImageView!
    
    
    fileprivate let CollectionCellId = "AddPhotoCell"
    let CollectionCell = UINib(nibName: "AddPhotoCell", bundle: nil)
    
    var images = [AdvImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.add.setBackgroundImage(UIImage(named: "Plus"), for: .normal)
        self.back.setBackgroundImage(UIImage(named: "arrow_pointt"), for: .normal)
        photosCollectionView.register(CollectionCell, forCellWithReuseIdentifier: CollectionCellId)
        setupCollectionView(collectionView: photosCollectionView)
        saveImages()
    }
    
    func saveImages() {
        if images.count == 0 {
            self.imageFill.isHidden = false
            self.save.isHidden = true
            self.photosCollectionView.isHidden = true
        }
        else {
            self.imageFill.isHidden = true
            self.save.isHidden = false
            self.photosCollectionView.isHidden = false
        }
    }

    @IBAction func backBtn(_ sender: Any) {
        let vc = TabBarController(nibName: "TabBarController", bundle: nil)
        vc.selectedIndex = 3
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // Mark: - open camera
    func openCameraOrGallery() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Attach Photo", message: "choose a photo", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                //show alert
                let alert = UIAlertController(title: "Camera does not work", message: "Restart Your App", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("No camera")
            }
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Open photo library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        openCameraOrGallery()
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        // save images that choosen
    }
}

extension AddPhotoVCViewController: UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let imageData: Data = image.jpegData(compressionQuality: 0.5)!
            
            self.images.append(AdvImage(img: image, imgData: imageData))
            photosCollectionView.reloadData()
            saveImages()
            dismiss(animated: true, completion: nil)
        }
        else if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            let imageData: Data = image.jpegData(compressionQuality: 0.5)!
            
            self.images.append(AdvImage(img: image, imgData: imageData))
            photosCollectionView.reloadData()
            saveImages()
            dismiss(animated: true, completion: nil)
        }
    }
}
