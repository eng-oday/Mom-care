//
//  CustomTabBar.swift
//  MomCare
//
//  Created by Eissa on 3/31/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        createTabBar()
    }
    
    // Mark: - func that create TabBarController
    func createTabBar() {
        
        let moreVc = MoreVC(nibName: "MoreVC", bundle: nil)
        let toolVc = ToolsVC(nibName: "ToolsVC", bundle: nil)
        let homeVc = HomeVC(nibName: "HomeVC", bundle: nil)
        let photoVc = PhotoAlbumVC(nibName: "PhotoAlbumVC", bundle: nil)
        let medicalVc = MedicalGuideVC(nibName: "MedicalGuideVC", bundle: nil)
        
        let tabIcon1 = UITabBarItem(title: "More", image: UIImage(named: "more"), selectedImage: nil)
        let tabIcon2 = UITabBarItem(title: "Tools", image: UIImage(named: "document"), selectedImage: nil)
        let tabIcon3 = UITabBarItem(title: "Trip Pregnancy", image: UIImage(named: ""), selectedImage: nil)
        let tabIcon4 = UITabBarItem(title: "Photo Album", image: UIImage(named: "image"), selectedImage: nil)
        let tabIcon5 = UITabBarItem(title: "Medical Guide", image: UIImage(named: "book"), selectedImage: nil)
        
             moreVc.tabBarItem = tabIcon1
             toolVc.tabBarItem = tabIcon2
             homeVc.tabBarItem = tabIcon3
             photoVc.tabBarItem = tabIcon4
             medicalVc.tabBarItem = tabIcon5

             let tabControllers = [moreVc, toolVc, homeVc, photoVc, medicalVc]
             self.tabBarController?.setViewControllers(tabControllers, animated: true)
             self.tabBar.tintColor = #colorLiteral(red: 0.2973757386, green: 0.8578762412, blue: 0.8900747895, alpha: 1)
             self.tabBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
             self.viewControllers = tabControllers
    }
    
    // M/Users/eissa/Desktop/BC-master/MomCare/Scenes/View/Controllers/Gedamy/Tools/Controllers/ToolsVC.swiftark: - func of delegate of TabBarController
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        return true
    }
}
