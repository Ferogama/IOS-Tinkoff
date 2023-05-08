
import Foundation
import UIKit


protocol GameViewControllerInput: AnyObject {
    func showQuestions()
    func showImage(image: UIImage?)
}

protocol GameViewControllerOutput: AnyObject {
    func loadScreen()
}
