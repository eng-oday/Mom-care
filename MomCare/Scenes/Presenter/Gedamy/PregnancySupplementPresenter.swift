//
//  PregnancySupplementPresenter.swift
//  MomCare
//
//  Created by Eissa on 5/5/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation
import UIKit

protocol PregnancySupplementCellView {
    func displayName(name: String)
}

class PregnancySupplementPresenter {
    
    //private var nutritionNeededCell = [MOdelOfcell]()
    static var shared = PregnancySupplementPresenter()
    var nutrionNameArr = ["فوليك آسيد","حديد","كالسيوم","ماغنيسيوم","زنك","اوميجا3"]
    
    func getNutritionNeededCellCount() -> Int {
        //return nutritionNeededCell.count
        return nutrionNameArr.count
    }
    
    func configure(cell: NutritionNeededCellView, for index: Int) {
        //let user = nutritionNeededCell[index]
//        cell.displayImage(name: user.image)
//        cell.displayName(name: user.name)
        
    }
}
