//
//  EndController.swift
//  WarCardGame
//
//  Created by Student31 on 14/08/2024.
//

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
        if let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            self.present(vc, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
