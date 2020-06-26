//
//  NutritionNeddedVCPresenter.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/2/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

protocol NutritionNeededCellView {
    func displayName(name: String)
}

class NutritionNeededVCPresenter {
    
    //private var nutritionNeededCell = [MOdelOfcell]()
    static var shared = NutritionNeededVCPresenter()
    var nutritionImageArr = ["supplement","healthy-food"]
    var nutrionNameArr = ["مكمل الحمل" ,"مبادئ الأكل"]
    
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







