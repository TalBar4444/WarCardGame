//
//  ViewController.swift
//  WarCardGame
//
//  Created by TalBar on 11/08/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var main_BTN_insertName: UIButton!
    @IBOutlet weak var main_LBL_start: UIButton!
    
    @IBOutlet weak var main_LBL_name: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        main_LBL_name.isHidden = true
    }

    @IBAction func openMainActivity(_ sender: UIButton) {
        main_LBL_name.text = "Hello Tal"
    }
    
//    @IBAction func insertName(_ sender: Any) {
//        let popUpVC = NamePopUpViewController()
//    }
//
//    func displayGreeting(name: String) {
//        main_LBL_name.text = "Hi, \(name)!"
//        main_LBL_name.isHidden = false
//        main_BTN_insertName.isHidden = true
//    }
}

//extension ViewController: NamePopUpViewControllerDelegate {
//    func didEnterName(name: String) {
//        displayGreeting(name: name)
//    }
//}

