//
//  ToolsVC.swift
//  MomCare
//
//  Created by Eissa on 4/30/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class ToolsVC: UIViewController {
    
    @IBOutlet weak var searchTxtField: UITextField!{
        didSet {
            searchTxtField.tintColor = UIColor.lightGray
//            searchTxtField.setIcon(#imageLiteral(resourceName: "search"))
        }
    }
    @IBOutlet weak var toolsCollView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        self.searchTxtField.delegate = self
    }
    
    var nutrionNeeded : NutritionNeededVC?
    var arrData : [String] = ["الفحوصات","تغذية الحامل","تغذية الطفل","دليل نوم الطفل"]
    var arrFilterData : [String] = []
    var isSearch : Bool = false
    var toolsPresenter : ToolsPresenter?
    
}

