//
//  EndController.swift
//  WarCardGame
//
//  Created by Tal Bar on 13/08/2024.
//

import Foundation
import UIKit

class EndController: UIViewController {
    
    @IBOutlet weak var end_LBL_name: UILabel!
    
    @IBOutlet weak var end_LBL_score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UserDefaults.standard.string(forKey: "winnerName")
        let score = UserDefaults.standard.string(forKey: "winnerScore")
        
        end_LBL_name.text = name
        end_LBL_score.text = score
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            self.present(ViewController, animated: true, completion: nil)
        }
    }
}
