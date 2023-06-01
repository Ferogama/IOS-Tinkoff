import UIKit

protocol StartViewControllerOutput: AnyObject {
    func viewDidLoad()
    func didTapRegister()
    func tappedPlayButton()
    func startPlaying()
    func finishPlaying()
    func didTapLogoutButton()
    func didTapRatingButton()
    
}

protocol StartViewControllerInput: AnyObject {
    func showImage(image: UIImage?)
    func showName(name: String, balance: Int)
    func startMusic()
    func stopMusic()
    func reloadAfterLogout()
    
}
