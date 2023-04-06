import UIKit

protocol StartViewControllerOutput: AnyObject {
    func viewDidLoad()
    func didTapPlay()
}

protocol StartViewControllerInput: AnyObject {
    func showImage(image: UIImage?)
}
