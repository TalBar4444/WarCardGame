//
//  EndController.swift
//  WarCardGame
//
//  Created by Tal Bar on 14/08/2024.
//

import UIKit

class EndController: UIViewController {
    
    @IBOutlet weak var end_LBL_name: UILabel!
    
    @IBOutlet weak var end_LBL_score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UserDefaults.standard.string(forKey: "winnerName")
        let score = UserDefaults.standard.string(forKey: "winnerScore")
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        end_LBL_name.text = name
        end_LBL_score.text = score
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
        
    }

}
