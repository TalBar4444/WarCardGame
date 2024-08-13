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
        startGame()
    }
    
//    @IBAction func switchCards(_ sender: Any) {
//    }
    func startGame() {
        if gameManager.isGameOver() {
            let winner = gameManager.getWinner()
            print(winner)
        }
        
        
        updateScoreLabel()
        gameTimer = Timer.scheduledTimer(timeInterval: 5.0,target: self, selector: #selector(playRound), userInfo: nil, repeats: true)
    }
    
    @objc func playRound() {
        let leftCard = gameManager.leftPlayer.getCardName()
        let rightCard = gameManager.rightPlayer.getCardName()
        
        // Update card image views
        game_IMG_leftCard.image = UIImage(named: leftCard)
        game_IMG_rightCard.image = UIImage(named: rightCard)

        
        gameManager.calcScore()
        updateScoreLabel()
        
        //checkfor game over
        if gameManager.isGameOver() {
            gameTimer?.invalidate()
        }
    }
    
    func updateScoreLabel(){
        game_LBL_leftScore.text = " \(gameManager.leftPlayer.getScore())"
        game_LBL_rightScore.text = " \(gameManager.rightPlayer.getScore())"
        game_LBL_time.text = "\(gameManager.round)"
    }
}
