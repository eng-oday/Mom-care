//
//  PagerController.swift
//  MomCare
//
//  Created by Eissa on 4/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class PagerController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    let firstView = FirstPC(nibName: "StartVC", bundle: nil)
    let secondView = SecondPC(nibName: "SecondPC", bundle: nil)
    let thirdView = ThirdPC(nibName: "ThirdPC", bundle: nil)
    let lastView = LastPC(nibName: "LastPC", bundle: nil)
    
    lazy var orderedViewControllers: [UIViewController] = {
        
        return[firstView, secondView, thirdView, lastView]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        self.setViewControllers([self.orderedViewControllers[0]],direction: .forward,animated: true,completion: nil)
        self.pageControl.numberOfPages = self.orderedViewControllers.count
        
        handlePageController()
    }

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {

        super.init(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: options)
    }
    
//    func configurePageControl() {
//        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 5))
//        
//        pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//        
//        self.pageControl.numberOfPages = orderedViewControllers.count
//        self.pageControl.currentPage = 0
//        self.pageControl.alpha = 0.5
//        self.pageControl.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//        self.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.184227705, green: 0.7012971044, blue: 0.7307940125, alpha: 1)
//        self.pageControl.isUserInteractionEnabled = false
//        self.view.addSubview(pageControl)
//    }
    
    func handlePageController() {

        let vc1 = self.orderedViewControllers[0] as! FirstPC
        vc1.pager = self

        let vc2 = self.orderedViewControllers[1] as! SecondPC
        vc2.pager = self

        let vc3 = self.orderedViewControllers[2] as! ThirdPC
        vc3.pager = self

        let vc4 = self.orderedViewControllers[3] as! LastPC
        vc4.pager = self
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
           
           let pageContentViewController = pageViewController.viewControllers![0]
           self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
           
       }
       
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
           
           guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
               return nil
           }
           
           let previousIndex = viewControllerIndex - 1
           guard previousIndex >= 0 else {
               //return orderedViewControllers.last
               return nil
           }
           
           guard orderedViewControllers.count > previousIndex else {
               return nil
           }
           
           return orderedViewControllers[previousIndex]
       }
       
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           
           guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
               return nil
           }
           
           let nextIndex = viewControllerIndex + 1
           guard orderedViewControllers.count != nextIndex else {
               //return orderedViewControllers.first
               return nil
           }
           
           guard orderedViewControllers.count > nextIndex else {
               return nil
           }
           
           return orderedViewControllers[nextIndex]
       }
  }

extension UIPageViewController {
    
    func goToNextPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: animated, completion: nil)
    }
    
    func goToPreviousPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
        setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
    }
}
