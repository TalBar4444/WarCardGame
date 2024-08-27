import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var game_IMG_leftCard: UIImageView!
    
    @IBOutlet weak var game_IMG_rightCard: UIImageView!
    @IBOutlet weak var game_LBL_leftScore: UILabel!
    
    @IBOutlet weak var game_LBL_rightScore: UILabel!
    
    @IBOutlet weak var game_LBL_time: UILabel!
    
    @IBOutlet weak var game_LBL_rightPlayer: UILabel!
    
    @IBOutlet weak var game_LBL_leftPlayer: UILabel!
    
    var gameManager = GameManager()
    
    var rightPlayerCenter: CGPoint = CGPoint()
    var leftPlayerCenter: CGPoint = CGPoint()
    var isOver = false


    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightPlayerCenter = game_IMG_rightCard.center
        leftPlayerCenter = game_IMG_leftCard.center
        
        // load the name of the player
        let name = UserDefaults.standard.string(forKey: "name")
        let _longitude = UserDefaults.standard.double(forKey: "longitude")
        
        
        if _longitude >= CENTER_Y {
            gameManager.rightPlayer.setName(name: name!)
            gameManager.leftPlayer.setName(name: "Computer")
        }else{
            gameManager.leftPlayer.setName(name: name!)
            gameManager.rightPlayer.setName(name: "Computer")
        }
        
        updateNameLabels()
        startGame()
    }
    
    func startGame() {
        updateScoreLabel()
        startRound()
    }
        
    func startRound() {
        if gameManager.isGameOver() {
            self.endGame()
        }
        
        if !isOver {
            gameTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats:false) {
                timer in self.revealCards()
            }
            
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
    
    func updateNameLabels(){
           game_LBL_leftPlayer.text = "\(self.gameManager.leftPlayer.name)"
           game_LBL_rightPlayer.text = "\(self.gameManager.rightPlayer.name)"
   }
    
    func updateScoreLabel(){
        game_LBL_leftScore.text = " \(gameManager.leftPlayer.getScore())"
        game_LBL_rightScore.text = " \(gameManager.rightPlayer.getScore())"
        game_LBL_time.text = "\(gameManager.round)"
    }
    
    deinit {
        gameTimer?.invalidate()
        gameTimer = nil
    }
    
    func endGame(){
        
        isOver = true
    
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.dismiss(animated: true, completion: nil)
        
        let winner = gameManager.getWinner()

        UserDefaults.standard.set(winner.getName(), forKey: "winnerName")
        UserDefaults.standard.set(winner.getScore(), forKey: "winnerScore")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let EndController = storyboard.instantiateViewController(withIdentifier: "EndController") as? EndController {
            self.navigationController?.pushViewController(EndController, animated: true)
        }
    }
}
