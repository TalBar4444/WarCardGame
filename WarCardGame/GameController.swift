import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var game_IMG_leftCard: UIImageView!
    
    @IBOutlet weak var game_IMG_rightCard: UIImageView!
    @IBOutlet weak var game_LBL_leftScore: UILabel!
    
    @IBOutlet weak var game_LBL_rightScore: UILabel!
    
    @IBOutlet weak var game_LBL_time: UILabel!
    
    var gameModel = GameModel()
    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    func startGame() {
        let values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        
        for value in values {
            let card = Card(image: cardImage, value: value)
            deck.append(card)
        }
        gameModel.deck = deck.shuffled()
        gameTimer = Timer.scheduledTimer(timeInterval: 5.0,target: self, selector: #selector(playRound), userInfo: nil, repeats: true)
    }
    
    @objc func playRound() {
        let leftCard = gameModel.deck.removeFirst()
        let rightCard = gameModel.deck.removeFirst();
        
        // Update card image views
        game_IMG_leftCard.image = leftCard.image
        game_IMG_rightCard.image = rightCard.image
        
        if leftCard.value > rightCard.value {
            gameModel.leftScore += 1
        } else if rightCard.value > leftCard.value {
            gameModel.rightScore += 1
            
        }
        
        //Update score labels
        game_LBL_leftScore.text = "\(gameModel.leftScore)"
        game_LBL_rightScore.text = "\(gameModel.rightScore)"
        
        gameModel.currentRound += 1
        game_LBL_time.text = "\(gameModel.currentRound)"
        
        //checkfor game over
        if gameModel.currentRound == 10 {
            gameTimer?.invalidate()
        }
    }
}
