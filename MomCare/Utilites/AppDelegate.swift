//
//  AppDelegate.swift
//  MomCare
//
//  Created by Eissa on 3/28/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import IQKeyboardManagerSwift
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        GMSServices.provideAPIKey("AIzaSyDYjCVA8YFhqN2pGiW4I8BCwhlxThs1Lc0")
//        GMSPlacesClient.provideAPIKey("AIzaSyDYjCVA8YFhqN2pGiW4I8BCwhlxThs1Lc0")
        GMSServices.provideAPIKey("AIzaSyCjCfK28DiDfJCX6HFLS8D5Uv504yFza-k")
        GMSPlacesClient.provideAPIKey("AIzaSyCjCfK28DiDfJCX6HFLS8D5Uv504yFza-k")
        
        
        NVActivityIndicatorView.DEFAULT_TYPE = .squareSpin
        NVActivityIndicatorView.DEFAULT_COLOR = #colorLiteral(red: 0.2973757386, green: 0.8578762412, blue: 0.8900747895, alpha: 1)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            
           let rootVC = PagerController(transitionStyle: UIPageViewController.TransitionStyle.pageCurl, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal)
            let nav = UINavigationController(rootViewController: rootVC)
            window.rootViewController = nav
            window.makeKeyAndVisible()
        }
        UIViewController.preventPageSheetPresentation
        return true
    }
    
    func restartApp() {
        let vc = TabBarController(nibName: "TabBarController", bundle: nil)
        vc.selectedIndex = 2
        self.window?.rootViewController = vc
    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

