import UIKit

protocol StartViewControllerOutput: AnyObject {
    func viewDidLoad()
    func didTapPlay()
    func dappedPlayButton()
    
}

protocol StartViewControllerInput: AnyObject {
    func showImage(image: UIImage?)
    func showName(name: String, balance: Int)
}
