//
//  ViewController.swift
//  WarCardGame
//
//  Created by TalBar on 11/08/2024.
//

import UIKit
import Foundation
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var main_LAY_name: UIStackView!
    
    @IBOutlet weak var main_EDT_name: UITextField!
    @IBOutlet weak var main_BTN_insertName: UIButton!
    
    @IBOutlet weak var main_LBL_name: UILabel!
    
    @IBOutlet weak var main_LBL_start: UIButton!
    
    @IBOutlet weak var main_IMG_left: UIImageView!
    
    @IBOutlet weak var main_IMG_right: UIImageView!
    
    var name: String = ""
    
    let locationManager = CLLocationManager()
       
    var locationPermission: CLLocationCoordinate2D? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        getCurrentLocation()
        
        if let name = UserDefaults.standard.string(forKey: "name") {
            self.name = name
            main_LBL_name.text = "Hello, \(name)"
            main_LAY_name.isHidden = true        
        }
    }
    
    
    @IBAction func insertName(_ sender: UIButton) {
        print("tal0")
        if main_EDT_name.hasText {
            name = main_EDT_name.text!
            main_LBL_name.text = "Hello, \(main_EDT_name.text!)"
            main_LAY_name.isHidden = true
        }
    }
    
    @IBAction func openMainActivity(_ sender: UIButton) {
        
        if name.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please Enter a name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        if locationPermission == nil {
            let alert = UIAlertController(title: "Error", message: "Please allow location services", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        UserDefaults.standard.set(name, forKey: "name")
        
        UserDefaults.standard.set(locationPermission?.longitude, forKey: "longitude")
    }
        
        

    func getCurrentLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        let myQueue = DispatchQueue(label:"myOwnQueue")
        myQueue.async {
          if CLLocationManager.locationServicesEnabled() {
              self.locationManager.delegate = self
              self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
              self.locationManager.startUpdatingLocation()
          }
        }

    }

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationValie: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        locationPermission = locationValie
        
        
        if locationPermission!.longitude > CENTER_Y{
            main_IMG_left.isHidden = true
            main_IMG_right.isHidden = false
        } else {
            main_IMG_left.isHidden = false
            main_IMG_right.isHidden = true
        }
        
        
        print("locations = \(locationValie.latitude) \(locationValie.longitude)")
        
    }
}


