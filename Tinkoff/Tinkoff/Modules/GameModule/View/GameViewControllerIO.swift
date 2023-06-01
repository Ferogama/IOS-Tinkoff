
import Foundation
import UIKit


protocol GameViewControllerInput: AnyObject {
    func showQuestions()
    func playMusic()
    func showImage(image: UIImage?)
    
}

protocol GameViewControllerOutput: AnyObject {
    func loadScreen()
    
    func finishTheGame(userscore: Int)
    func showResultController(userscore: Int)
}
