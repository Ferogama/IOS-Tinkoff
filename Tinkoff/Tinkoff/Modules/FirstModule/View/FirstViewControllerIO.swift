import UIKit

protocol FirstViewControllerOutput: AnyObject {
    func viewDidLoad()
    func didTapPlay()
}

protocol FirstViewControllerInput: AnyObject {
    func showImage(image: UIImage?)
}
