//
//  MapVC.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Alamofire
import SwiftyJSON

protocol SendCityData {
    
    func sendCity(cityName: String)
}

class MapVC: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var directionView: RoundedCornerView!
    @IBOutlet weak var saveView: RoundedCornerView!
    @IBOutlet weak var directionImg: UIImageView!
    @IBOutlet weak var saveImg: UIImageView!
    @IBOutlet weak var detailsView: RoundedTopView!
    @IBOutlet weak var hideView: UIButton!
    @IBOutlet weak var closeMap: UIButton!
    
    var locationManager = CLLocationManager()
    var lat: String!
    var lng: String!
    var marker = GMSMarker()
    var placeClient: GMSPlacesClient!
    
    var delegate: SendCityData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.detailsView.isHidden = true
        self.hideView.isHidden = true
        tapGesture()
        setUpImagesViews()
        userLocation()
    }
    
    // Mark: - func of putting images for UIViews
    func setUpImagesViews() {
        self.directionImg.image = UIImage(named: "Trends")
        self.saveImg.image = UIImage(named: "save")
    }

    // func handle user location on map
    func userLocation() {
        
        placeClient = GMSPlacesClient.shared()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        self.mapView.delegate = self
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
      
        let directionTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDirections))
        self.directionView.addGestureRecognizer(directionTapGesture)
        
        let saveCityTapGesture = UITapGestureRecognizer(target: self, action: #selector(saveCity))
        self.saveView.addGestureRecognizer(saveCityTapGesture)
    }
    
    // Mark: - func of getting address on map with latitude and longitude
    func GET(url: String, completion: @escaping (_ succeeded: Bool, _ result: [String: AnyObject]) -> Void) {
        
        request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (respone) in
            switch respone.result {
            case .failure(let error):
                print(error)
                completion(false, [:])
                
            case .success(let value):
                print(value)
                completion(true, value as! [String: AnyObject])
            }
        }
    }
    
    // Mark: - view directions on map
    @objc func viewDirections() {
        
        self.delegate?.sendCity(cityName: self.locationLabel.text ?? "")
        UIApplication.shared.open(URL(string: "https://www.google.com/maps/search/?api=1&query=\(self.lat ?? ""),\(self.lng ?? "")")!, options: [:], completionHandler: nil)
    }
    
    // Mark: - save choosen city
    @objc func saveCity() {
        
        self.delegate?.sendCity(cityName: self.locationLabel.text ?? "")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func hideButton(_ sender: Any) {
        
        self.detailsView.isHidden = true
        self.hideView.isHidden = true
    }
    
    @IBAction func closeMapBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// Mark: - extension to handle functions of CLLocationManagerDelegate
extension MapVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        locationManager.startUpdatingLocation()
        
        let userLocation = locations.last
        marker.position = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        
        let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude, zoom: 15)
        
        self.mapView.camera = camera
        self.mapView.isMyLocationEnabled = true
        marker.map = self.mapView
        
        self.lat = "\(userLocation!.coordinate.latitude)"
        self.lng = "\(userLocation!.coordinate.longitude)"
        print("Latitude = \(self.lat!)")
        print("Longitude = \(self.lng!)")
        
        let markerImage = UIImage(named: "location_blue")!.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: markerImage)
        marker.isDraggable = true
        
        // calling func to have address on map
        GET(url: "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + "\((self.lat)! ),\((self.lng)! )&key=AIzaSyDEJd62-3jzmktJR565uvRV6qtedNwwk3c&language=en") { [weak self] (success, result) in
            if success {
                let dict = result
                if let status = dict["status"] as? String {
                    if status == "OK" {
                        if let results = dict["results"] as? [[String:AnyObject]] {
                            let resultAddress = results[0]
                            let fullAddress = resultAddress["formatted_address"] as? String
//                            self!.cityName = fullAddress!.replacingOccurrences(of: ",", with: " ").replacingOccurrences(of: "-", with: " ")
                            
                            self!.locationLabel.text = fullAddress!
                            self!.marker.title = fullAddress!
                            print("City = \(self!.locationLabel.text)")
                        }
                    }
                    else {
                    }
                }
            }
            else {
            }
        }
       // marker.title = self.locationLabel.text
        locationManager.stopUpdatingLocation()
        self.detailsView.isHidden = false
        self.hideView.isHidden = false
    }
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            guard let address = response?.firstResult(), let lines = address.lines else {
                return
            }
            UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
          }
      }
   }
}

// Mark: - extension to handle functions of GSMapViewDelegate
extension MapVC: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("clicked on marker")
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("long press on window")
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        let view = UIView(frame: CGRect.init(x: 5, y: 5, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 35
        let title = UILabel(frame: CGRect.init(x: 5, y: 10, width: view.frame.width - 5, height: 50))
        title.numberOfLines = 2
        title.textAlignment = .center
        title.font = UIFont(name: "Cairo", size: 15)
        title.text = self.marker.title!
        view.addSubview(title)
        return view
    }
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
         print("draging start")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("did draging")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("end draging")
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        marker.position = coordinate
        self.lat = "\( marker.position.latitude)"
        print("MYLAT = \(self.lat!)")
        
        self.lng = "\( marker.position.longitude)"
        print("MYLNG = \(self.lng!)")
        
        GET(url: "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + "\((self.lat)! ),\((self.lng)! )&key=AIzaSyDEJd62-3jzmktJR565uvRV6qtedNwwk3c&language=en") { [weak self] (success, result) in
            
            if success {
                        let dict = result
                        if let status = dict["status"] as? String {
                            if status == "OK" {
                                if let results = dict["results"] as? [[String:AnyObject]] {
                                    let resultAddress = results[0]
                                    let fullAddress = resultAddress["formatted_address"] as? String
        //                            self!.cityName = fullAddress!.replacingOccurrences(of: ",", with: " ").replacingOccurrences(of: "-", with: " ")
                                    
                                    self!.locationLabel.text = fullAddress!
                                   // self!.marker.title = fullAddress!
                                    self!.marker.title = fullAddress!
                                    print("City = \(self!.locationLabel.text)")
                                }
                            }
                            else {
                            }
                        }
                    }
                    else {
                    }
                }
        marker.map = self.mapView
        marker.title = ""
        marker.icon = UIImage(named: "location_blue")
        marker.isDraggable = true
        locationManager.stopUpdatingLocation()
        
        marker.title = self.locationLabel.text
        locationManager.stopUpdatingLocation()
        self.detailsView.isHidden = false
        self.hideView.isHidden = false
    }
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
         reverseGeocodeCoordinate(position.target)
         self.detailsView.isHidden = false
         self.hideView.isHidden = false
    }
}
