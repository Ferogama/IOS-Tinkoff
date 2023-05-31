import UIKit

protocol StartViewControllerOutput: AnyObject {
    func viewDidLoad()
    func didTapRegister()
    func dappedPlayButton()
    func startPlaying()
    func finishPlaying()
    func didTapLogoutButton()
    
}

protocol StartViewControllerInput: AnyObject {
    func showImage(image: UIImage?)
    func showName(name: String, balance: Int)
    func startMusic()
    func stopMusic()
    func reloadAfterLogout()
    
}
