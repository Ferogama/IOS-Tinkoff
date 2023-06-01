

import Foundation
import CoreData

protocol RatingViewControllerOutput: AnyObject {
    func didTapBackButton()
    func data(for index: Int) -> (String, String)
    func viewDidLoad()
}

protocol RatingViewControllerInput: AnyObject {
    func reloadNotes()
}
