//
//  ToolsVC+Extensions.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/2/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//


import Foundation
import UIKit

extension ToolsVC: UICollectionViewDataSource {
    
    func setupCollectionView(){
        self.toolsCollView.dataSource = self
        self.toolsCollView.delegate = self
        toolsCollView.registerCell(cell: ToolsCV.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearch {
            return arrFilterData.count
        }
        else{
            return arrData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToolsCV", for: indexPath) as! ToolsCV
        
        switch indexPath.item {
        case 0:
            cell.backgroundColor = UIColor(red: 42, green: 165, blue: 172)
            cell.shadowDecorate(color: #colorLiteral(red: 0.1647058824, green: 0.6470588235, blue: 0.6745098039, alpha: 1))
            case 1:
            cell.backgroundColor = UIColor(red: 242, green: 171, blue: 53)
            cell.shadowDecorate(color: #colorLiteral(red: 0.9490196078, green: 0.6705882353, blue: 0.2078431373, alpha: 1))
            case 2:
            cell.backgroundColor = UIColor(red: 234, green: 88, blue: 18)
            cell.shadowDecorate(color: #colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.07058823529, alpha: 1))
            case 3:
            cell.backgroundColor = UIColor(red: 234, green: 88, blue: 18)
            cell.shadowDecorate(color: #colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.07058823529, alpha: 1))

        default:
            break
        }

        cell.toolImage.image = UIImage(named: ToolsPresenter.shared.nutritionImageArr[indexPath.row])
        cell.toolTitle.text = self.arrData[indexPath.row]
        if isSearch {
            cell.toolTitle.text = arrFilterData[indexPath.row]
        }
        else{
            cell.toolTitle.text = arrData[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        return CGSize(width: (UIScreen.main.bounds.width - 70) / 3, height: 110)
    }
}

extension ToolsVC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //Horizental Spacing
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //Vertical Spacing
        return 15
    }
}

extension ToolsVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeCell(cell: ToolsCV.self, indexPath: indexPath)
        let titleCell = cell.toolTitle.text ?? ""
        //["Checks","Pregnant Nutrition","Baby Nutrition","Baby Sleep Guide"]
        switch indexPath.item {
        case 0:
            let vc = CheckVC(nibName: "CheckVC", bundle: nil)
            vc.titleName = self.arrData[0]
            let nav = UINavigationController(rootViewController: vc)
            self.view.window?.rootViewController = nav
            case 1:
            let vc = PregenantNutritionVC(nibName: "PregenantNutritionVC", bundle: nil)
            vc.titleName = self.arrData[1]
            let nav = UINavigationController(rootViewController: vc)
            self.view.window?.rootViewController = nav
            case 2:
            let vc = BabyNutritionVC(nibName: "BabyNutritionVC", bundle: nil)
            vc.titleName = self.arrData[2]
            let nav = UINavigationController(rootViewController: vc)
            self.view.window?.rootViewController = nav
            case 3:
            let vc = BabySleepVC(nibName: "BabySleepVC", bundle: nil)
            vc.titleName = self.arrData[3]
            let nav = UINavigationController(rootViewController: vc)
            self.view.window?.rootViewController = nav
        default:
            break
        }
    }
}

extension ToolsVC : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        var searchText = textField.text! + string

        if string  == "" {
            searchText = (searchText as String).substring(to: searchText.index(before: searchText.endIndex))
        }

        if searchText == "" {
            isSearch = false
            self.toolsCollView.reloadData()
        }
        else{
            getSearchArrayContains(searchText)
        }
        return true
    }

    // Predicate to filter data
    func getSearchArrayContains(_ text : String) {
        let predicate : NSPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", text)
        arrFilterData = (arrData as NSArray).filtered(using: predicate) as! [String]
        isSearch = true
        self.toolsCollView.reloadData()
    }
}
