//
//  MedicalGuide+Extension.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/9/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

extension MedicalGuideVC:UICollectionViewDataSource{
    
    func setupCollectionView(collectionView : UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func setupPaddingScrollview() {
        // padding space = collection view width - cell width
        let leftPadding = (doctorsCollectionView.frame.size.width  - doctorsCollectionView.frame.size.height) / 2.0
        let rightPadding = leftPadding
        doctorsCollectionView.contentInset = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mostReadingCollectionView{
            return 5
        }else{
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == doctorsCollectionView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoctorsCVCell", for: indexPath) as? DoctorsCVCell{
                
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else if collectionView == allObjctsCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllOfObjectsCVCell", for: indexPath) as? AllOfObjectsCVCell{
                cell.titleLbl.text = self.titleArr[indexPath.row]
                cell.image.image = UIImage(named: self.objectsImages[indexPath.row])
//                cell.delegate = self
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostReadingCVCell", for: indexPath) as? MostReadingCVCell{
                cell.imageProfile.image = UIImage(named: self.images[indexPath.row])
                cell.lable.text = self.titles[indexPath.row]
                return cell
            }else{
                return UICollectionViewCell()
            }
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == self.allObjctsCollectionView{
//            return CGSize(width: collectionView.frame.size.width / 3, height: collectionView.frame.size.height)
//        }else{
//            return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
//        }
//    }
}

extension MedicalGuideVC : UIScrollViewDelegate {
    // perform scaling whenever the collection view is being scrolled
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // center X of collection View
        let centerX = self.doctorsCollectionView.center.x
        
        // only perform the scaling on cells that are visible on screen
        for cell in self.doctorsCollectionView.visibleCells {
            
            // coordinate of the cell in the viewcontroller's root view coordinate space
            let basePosition = cell.convert(CGPoint.zero, to: self.view)
            let cellCenterX = basePosition.x + self.doctorsCollectionView.frame.size.height / 2.0
            
            let distance = abs(cellCenterX - centerX)
            
            let tolerance : CGFloat = 0.02
            var scale = 1.00 + tolerance - (( distance / centerX ) * 0.105)
            if(scale > 1.0){
                scale = 1.0
            }
            
            // set minimum scale so the previous and next album art will have the same size
            // I got this value from trial and error
            // I have no idea why the previous and next album art will not be same size when this is not set 😅
            if(scale < 0.860091){
                scale = 0.860091
            }
            
            // Transform the cell size based on the scale
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
            // change the alpha of the image view
            let coverCell = cell as! DoctorsCVCell
            coverCell.containerView.alpha = changeSizeScaleToAlphaScale(scale)
        }
        /// connect page control with collection view
        let collectionView = scrollView as! UICollectionView
        if collectionView == mostReadingCollectionView{
            let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            let indexPath = collectionView.indexPathForItem(at: visiblePoint)
            myPageControl.currentPage = (indexPath?.item ?? 0)
        }
    }
    
    // for custom snap-to paging, when user stop scrolling
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        var indexOfCellWithLargestWidth = 0
        var largestWidth : CGFloat = 1
        
        for cell in self.doctorsCollectionView.visibleCells {
            if cell.frame.size.width > largestWidth {
                largestWidth = cell.frame.size.width
                if let indexPath = self.doctorsCollectionView.indexPath(for: cell) {
                    indexOfCellWithLargestWidth = indexPath.item
                }
            }
        }
        
        doctorsCollectionView.scrollToItem(at: IndexPath(item: indexOfCellWithLargestWidth, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    // map the scale of cell size to alpha of image view using formula below
    // https://stackoverflow.com/questions/5294955/how-to-scale-down-a-range-of-numbers-with-a-known-min-and-max-value
    func changeSizeScaleToAlphaScale(_ x : CGFloat) -> CGFloat {
        let minScale : CGFloat = 0.86
        let maxScale : CGFloat = 1.0
        
        let minAlpha : CGFloat = 0.25
        let maxAlpha : CGFloat = 1.0
        
        return ((maxAlpha - minAlpha) * (x - minScale)) / (maxScale - minScale) + minAlpha
    }
    
    func snapToNearestCell(scrollView: UIScrollView) {
        let middlePoint = Int(scrollView.contentOffset.x + UIScreen.main.bounds.width / 2)
        if let indexPath = self.doctorsCollectionView.indexPathForItem(at: CGPoint(x: middlePoint, y: 0)) {
            self.doctorsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
//
//extension MedicalGuideVC : UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView == self.allObjctsCollectionView{
//        return UIEdgeInsets(top: 20, left: 40, bottom: 10, right: 40)
//        }
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        //Horizental Spacing
//        if collectionView == self.allObjctsCollectionView{
//        return 10
//        }
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        //Vertical Spacing
//        return 0
//    }
//}
extension MedicalGuideVC:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mostReadingCollectionView{
            let vc = MoreDetailsVC(nibName: "MoreDetailsVC", bundle: nil)
            vc.imageName = self.images[indexPath.row]
            vc.desc = self.descArr[indexPath.row]
            vc.headTitle = self.titles[indexPath.row]
            let nav = UINavigationController(rootViewController: vc)
            self.view.window?.rootViewController = nav
        }
        if collectionView == doctorsCollectionView{
            let vc = DrProfileVC(nibName: "DrProfileVC", bundle: nil)
            let nav = UINavigationController(rootViewController: vc)
            self.view.window?.rootViewController = nav
           // self.handlePushSegue(viewController: DrProfileVC.self)
        }
        var arr = ["https://www.altebby.com/برنامج-أنت%D9%90-وطفلك-للعناية-بالطفل-من-ي/","https://www.elevitarabia.com/ar/breastfeeding/",
              "https://www.mayoclinic.org/ar/healthy-lifestyle/labor-and-delivery/in-depth/stages-of-labor/art-20046545",
              "https://www.unicef.org/arabic/health/health_42779.html",
              "https://www.health.gov.il/Arabic/Subjects/pregnancy/during/Pages/proper_nutrition_during_pregnancy.aspx",
              "https://www.doctoori.net/pregnancy-birth/labour-and-birth/pregnancybirthbeyond-for-dad.html"
        ]
        if collectionView == allObjctsCollectionView{
//            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllOfObjectsCVCell", for: indexPath) as? AllOfObjectsCVCell{
                switch indexPath.row {
                case 0:
                    guard let url = URL(string: "https://www.altebby.com/برنامج-أنت%D9%90-وطفلك-للعناية-بالطفل-من-ي/") else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                case 1:
                    guard let url = URL(string: "https://www.elevitarabia.com/ar/breastfeeding/") else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                case 2:
                    guard let url = URL(string: "https://www.mayoclinic.org/ar/healthy-lifestyle/labor-and-delivery/in-depth/stages-of-labor/art-20046545") else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    
                case 3:
                    guard let url = URL(string: "https://www.unicef.org/arabic/health/health_42779.html") else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                
                case 4:
                    guard let url = URL(string: "https://www.health.gov.il/Arabic/Subjects/pregnancy/during/Pages/proper_nutrition_during_pregnancy.aspx") else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }

                case 5:
                    guard let url = URL(string: "https://www.doctoori.net/pregnancy-birth/labour-and-birth/pregnancybirthbeyond-for-dad.html") else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                default:
                    return
                }
            }
    }
}

//extension MedicalGuideVC : CellTapped {
//    func cellTappedBu(arr: [String]) {
//        <#code#>
//    }
//}
