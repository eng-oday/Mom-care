//
//  ToolsPresenter.swift
//  MomCare
//
//  Created by Eissa on 5/5/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

protocol ToolsCellView {
    func displayName(name: String)
}

class ToolsPresenter {
    
    //private var nutritionNeededCell = [MOdelOfcell]()
    static var shared = ToolsPresenter()
    var nutritionImageArr = ["list","plate","milk","sleep"]
    var nutrionNameArr = ["Checks ","Nutrition Pregnant","Nutrition Baby","Baby Sleep Guide"]
    
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
