
import Foundation
import UIKit


protocol GameViewControllerInput: AnyObject {
    func showQuestions()
    func showImage(image: UIImage?)
}

protocol GameViewControllerOutput: AnyObject {
    func loadScreen()
    func saveUserBalanceInCoreData(name: String, score: Int)
    func finishTheGame(userscore: Int)
    func showResultController(userscore: Int)
}
