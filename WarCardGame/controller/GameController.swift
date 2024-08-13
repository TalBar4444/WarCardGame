import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var game_IMG_leftCard: UIImageView!
    
    @IBOutlet weak var game_IMG_rightCard: UIImageView!
    @IBOutlet weak var game_LBL_leftScore: UILabel!
    
    @IBOutlet weak var game_LBL_rightScore: UILabel!
    
    @IBOutlet weak var game_LBL_time: UILabel!
    
    var gameManager = GameManager()

    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = UserDefaults.standard.string(forKey: "name")
        startGame()
    }
    
    func startGame() {
        updateScoreLabel()
        startRound()
    }
        
    func startRound() {
        if gameManager.isGameOver() {
            endGame()
        }
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats:false) {
            timer in self.revealCards()
        }
        
    }

    func revealCards() {
        
        let leftCard = gameManager.leftPlayer.getCardName()
        let rightCard = gameManager.rightPlayer.getCardName()
        
        // show the cards
        game_IMG_leftCard.image = UIImage(named: leftCard)
        game_IMG_rightCard.image = UIImage(named: rightCard)
        gameManager.calcScore()
        updateScoreLabel()

        // Start the 3-seconds timer
        gameTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats:false) { timer in
            self.hideCards()
        }
    }
    
    func hideCards(){
        game_IMG_leftCard.image = UIImage(named: "back")
        game_IMG_rightCard.image = UIImage(named: "back")

        startRound()
    }
    
    func updateScoreLabel(){
        game_LBL_leftScore.text = " \(gameManager.leftPlayer.getScore())"
        game_LBL_rightScore.text = " \(gameManager.rightPlayer.getScore())"
        game_LBL_time.text = "\(gameManager.round)"
    }
    
    func endGame(){
        
//        performSegue(withIdentifier: "gameOver", sender: self)
        let winner = gameManager.getWinner()

        UserDefaults.standard.set(winner.getName(), forKey: "winnerName")
        UserDefaults.standard.set(winner.getScore(), forKey: "winnerScore")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let endController = storyboard.instantiateViewController(withIdentifier: "EndController") as? EndController {
            self.present(endController, animated: true, completion: nil)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "gameOver" {
//            let destinationVC = segue.destination as? EndController
//            let winner = gameManager.getWinner()
//            destinationVC?.end_LBL_name = winner.getName().
//            destinationVC?.end_LBL_score = winner.getScore()
//
//        }
//    }
}
