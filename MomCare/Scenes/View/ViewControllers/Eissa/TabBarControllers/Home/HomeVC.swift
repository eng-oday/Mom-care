//
//  HomeVC.swift
//  MomCare
//
//  Created by Eissa on 3/31/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import MBSegmentControll
import ActionSheetPicker_3_0

class HomeVC: UIViewController {
    
    @IBOutlet weak var adviciesCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var examinationsTableView: UITableView!
    @IBOutlet weak var articleCollectionView: UICollectionView!
    @IBOutlet weak var segmentedControll: MBSegmentControll!
    @IBOutlet weak var weekNumber: RoundedButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var motherImg: UIImageView!
    @IBOutlet weak var motherName: UILabel!
    @IBOutlet weak var dayNumberLb: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var imagineImg: UIImageView!
    @IBOutlet weak var detailsOfBaby: UITextView!
    @IBOutlet weak var babyImg: UIImageView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var weekNumberLb: UILabel!
    @IBOutlet weak var detailsPregnancy: UILabel!
    @IBOutlet weak var examinationImg: UIImageView!
    @IBOutlet weak var examinationNumber: UILabel!
    @IBOutlet weak var moreExamination: UIButton!
    @IBOutlet weak var numExaminationweekLb: UILabel!
    @IBOutlet weak var secondWeekNumberLb: UILabel!
    @IBOutlet weak var secondDayNumLb: UILabel!
    @IBOutlet weak var moreInfoTextField: UITextView!
    @IBOutlet weak var articleImg: UIImageView!
    @IBOutlet weak var anotherWeak: RoundedButton!
    @IBOutlet weak var motherProfileView: UIView!
    @IBOutlet weak var goToProfile: UIButton!
    
    let paragraphStyle = NSMutableParagraphStyle()
    @objc func actionPickerDone() {}
    @objc func actionPickerCancel() {}
    
    fileprivate let firstCollectionCellId = "AdvicesHomeCell"
    fileprivate let tabelCellId = "ExaminationsTableCell"
    fileprivate let articleCollectionCellId = "ArticlesCollectionCell"
    
    let firstCollectionCell = UINib(nibName: "AdvicesHomeCell", bundle: nil)
    let tableNibCell = UINib(nibName: "ExaminationsTableCell", bundle: nil)
    let articleCollectionCell = UINib(nibName: "ArticlesCollectionCell", bundle: nil)
    
    var weekNumbersArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.anotherWeak.isHidden = true
        self.adviciesCollectionView.tag = 1
        self.articleCollectionView.tag = 2
        self.logoImg.image = UIImage(named: "LOGO")
        self.motherImg.image = UIImage(named: "girl")
        self.examinationImg.image = UIImage(named: "surface1")
        self.articleImg.image = UIImage(named: "book-1")
        self.goToProfile.setBackgroundImage(UIImage(named: "forward"), for: .normal)
        self.adviciesCollectionView?.register(firstCollectionCell, forCellWithReuseIdentifier: firstCollectionCellId)
        self.articleCollectionView.register(articleCollectionCell, forCellWithReuseIdentifier: articleCollectionCellId)
        self.examinationsTableView.register(tableNibCell, forCellReuseIdentifier: tabelCellId)
        setupCollectionView(collectionView: adviciesCollectionView)
        setupCollectionView(collectionView: articleCollectionView)
        setupTableView(tableView: examinationsTableView)
        self.pageController.numberOfPages = 10 // array of count
        self.pageController.isEnabled = false
        paragraphStyle.alignment = .center
        setupSegmenttedControl()
        getWeekNumbers()
        tapGesture()
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
        let motherProfileTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToMotherProfileBtn(_:)))
        self.motherProfileView.addGestureRecognizer(motherProfileTapGesture)
    }
    
    // Mark: - func of get Week numbers
    func getWeekNumbers() {
        
        for num in 0..<36 {
            let newNum = "\(num + 1)"
            self.weekNumbersArray.append(newNum)
        }
    }
    
    // Mark: - setup MBSegmentedControl
    func setupSegmenttedControl() {
        
        segmentedControll.buttonTitles = ["Pregnancy", "Pregnant health", "The fetus"]
        segmentedControll.selecteSegment(at: 0)
        segmentedControll.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        segmentedControll.borderWidth = 0.8
        segmentedControll.roundCorner = true
        segmentedControll.font = UIFont(name: "Cairo-Regular", size: 13)!
        segmentedControll.isLine = false
        segmentedControll.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        segmentedControll.textColor = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1)
        segmentedControll.selectedTextColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        segmentedControll.selectedColor = #colorLiteral(red: 0.2588235294, green: 0.831372549, blue: 0.862745098, alpha: 1)
        segmentedControll.addTarget(self, action: #selector(segmentedControllTapped(_:)), for: .valueChanged)
    }
    
    // Mark: - func of choose weak number
    func chooseWeekNumbers() {
        
        let pick = ActionSheetStringPicker(title: "", rows: weekNumbersArray, initialSelection: 0, doneBlock: { picker, indexes, values in
            print(indexes)
            print(values!)
            
            // .....check if choosen week is the same current or not
            let currentWeekNum = self.weekNumber.titleLabel?.text
            let weekChoosen = self.weekNumbersArray[indexes]
            if currentWeekNum != weekChoosen {
                self.anotherWeak.setTitle(weekChoosen, for: .normal)
                self.anotherWeak.isHidden = false
            }
            else {
                Alert.showErrorAlert(title: "This is your current week, choose different one\n", body: "")
            }
            
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: weekNumber)
        let bar1 = UIBarButtonItem.init(title: "Confirm", style: .plain, target: self, action: #selector(actionPickerDone))
        let bar2 = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(actionPickerCancel))
        // Done button
        bar1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        // Cancel button
        bar2.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        // title of actionsheet
        pick?.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 30) as Any, NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
        pick?.pickerBackgroundColor = UIColor.white
        pick?.toolbarBackgroundColor = UIColor.white
        pick?.setDoneButton(bar1)
        pick?.setCancelButton(bar2)
        // elements in action sheet
        pick?.pickerTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 20) as Any,NSAttributedString.Key.paragraphStyle: paragraphStyle,NSAttributedString.Key.foregroundColor: UIColor.init(red: 0, green: 212, blue: 220)]
        pick?.show()
    }
    
    @IBAction func segmentedControllTapped(_ sender: Any) {
        
        // handle change segmentedControll tapped
        if segmentedControll.selectedSegmentIndex == 0 {
            // handle what happen in pregnancy index
        }
        else if segmentedControll.selectedSegmentIndex == 1 {
            // handle what happen in Pregnant health index
        }
        else  {
            // handle what happen in The fetus index
        }
    }
    
    @IBAction func changeWeekNumBtn(_ sender: Any) {
        chooseWeekNumbers()
    }
    
    @IBAction func searchbtn(_ sender: Any) {
        
    }
    
    @IBAction func goToMotherProfileBtn(_ sender: Any) {
        let vc = MyProfileVC(nibName: "MyProfileVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
    
    @IBAction func goToExaminationBtn(_ sender: Any) {
        let vc = CheckVC(nibName: "CheckVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
    
    @IBAction func anotherWeekBtn(_ sender: Any) {
        self.anotherWeak.isHidden = true
    }
}



