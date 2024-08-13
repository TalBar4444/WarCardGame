//
//  ViewController.swift
//  WarCardGame
//
//  Created by Student31 on 11/08/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var main_LBL_start: UIButton!
    
    @IBOutlet weak var main_LBL_name: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    @IBAction func sendClicked(_ sender: UIButton) {
//        main_BTN_send.setTitleText(text: "Sending")
//        main_LBL_title.text = "Hello World"
//    }
    @IBAction func openMainActivity(_ sender: UIButton) {
        main_LBL_name.text = "Hello Tal"
    }
    
}

