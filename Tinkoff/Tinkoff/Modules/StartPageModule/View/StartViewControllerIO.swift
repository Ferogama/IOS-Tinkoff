import UIKit

protocol StartViewControllerOutput: AnyObject {
    func viewDidLoad()
    func didTapPlay()
    func dappedPlayButton()
    func startPlaying()
    func finishPlaying()
    
}

protocol StartViewControllerInput: AnyObject {
    func showImage(image: UIImage?)
    func showName(name: String, balance: Int,isAuth: Bool)
    func startMusic()
    func stopMusic()
}
