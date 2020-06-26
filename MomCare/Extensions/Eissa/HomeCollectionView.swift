//
//  HomeCollectionView.swift
//  MomCare
//
//  Created by Eissa on 4/15/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDataSource{
    
    func setupCollectionView(collectionView : UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func setupPaddingScrollview() {
        
        if adviciesCollectionView.tag == 1 {
            
            // padding space = collection view width - cell width
            let leftPadding = (adviciesCollectionView.frame.size.width  - adviciesCollectionView.frame.size.height) / 2.0
            let rightPadding = leftPadding
            adviciesCollectionView.contentInset = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
           }
       }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView.tag == 1 {
                return 10
            }
            else if collectionView.tag == 2{
                return 10
            }
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if collectionView.tag == 1 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvicesHomeCell", for: indexPath) as? AdvicesHomeCell else {return AdvicesHomeCell()}
                return cell
            }
            else if collectionView.tag == 2 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCollectionCell", for: indexPath) as? ArticlesCollectionCell else {return ArticlesCollectionCell()}
                return cell
            }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvicesHomeCell", for: indexPath) as? AdvicesHomeCell else {return AdvicesHomeCell()}
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 2 {
            let vc = ArticlesVC(nibName: "ArticlesVC", bundle: nil)
            let nav = UINavigationController(rootViewController: vc)
            self.view.window?.rootViewController = nav
        }
     }
  }

extension HomeVC: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView.tag == 1 {
            return CGSize(width: UIScreen.main.bounds.width - 70, height: collectionView.frame.size.height)
        }
        else if collectionView.tag == 2 {
            return CGSize(width: articleCollectionView.bounds.width / 3, height: collectionView.frame.size.height)
        }
        return CGSize(width: UIScreen.main.bounds.width - 70, height: collectionView.frame.size.height)
    }
}

extension HomeVC : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(0), left: CGFloat(10), bottom: CGFloat(0), right: CGFloat(10))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
            //Horizental Spacing
            return -5
        }
        return 10
    }
}

extension HomeVC : UIScrollViewDelegate {
    // perform scaling whenever the collection view is being scrolled
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if adviciesCollectionView.tag == 1 {
            
            // center X of collection View
            let centerX = self.adviciesCollectionView.center.x
            
            // only perform the scaling on cells that are visible on screen
            for cell in self.adviciesCollectionView.visibleCells {
                
                // coordinate of the cell in the viewcontroller's root view coordinate space
                let basePosition = cell.convert(CGPoint.zero, to: self.view)
                let cellCenterX = basePosition.x + self.adviciesCollectionView.frame.size.height / 2.0
                
                let distance = fabs(cellCenterX - centerX)
                
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
                let coverCell = cell as! AdvicesHomeCell
                coverCell.containerView.alpha = changeSizeScaleToAlphaScale(scale)
            }
            /// connect page control with collection view
                let collectionView = adviciesCollectionView as! UICollectionView
                let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
                let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
                let indexPath = collectionView.indexPathForItem(at: visiblePoint)
                self.pageController.currentPage = (indexPath?.item ?? 0)
        }
      }
    
    // for custom snap-to paging, when user stop scrolling
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if adviciesCollectionView.tag == 1 {
            var indexOfCellWithLargestWidth = 0
            var largestWidth : CGFloat = 1
            
            for cell in self.adviciesCollectionView.visibleCells {
                if cell.frame.size.width > largestWidth {
                    largestWidth = cell.frame.size.width
                    if let indexPath = self.adviciesCollectionView.indexPath(for: cell) {
                        indexOfCellWithLargestWidth = indexPath.item
                    }
                }
            }
            
            adviciesCollectionView.scrollToItem(at: IndexPath(item: indexOfCellWithLargestWidth, section: 0), at: .centeredHorizontally, animated: true)
        }
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
        
        if adviciesCollectionView.tag == 1 {
            let middlePoint = Int(scrollView.contentOffset.x + UIScreen.main.bounds.width / 2)
            if let indexPath = self.adviciesCollectionView.indexPathForItem(at: CGPoint(x: middlePoint, y: 0)) {
                 self.adviciesCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
}
