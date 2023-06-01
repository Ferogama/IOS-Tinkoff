

import Foundation
import CoreData

protocol RatingViewControllerOutput: AnyObject {
    func didTapBackButton()
    func data(for index: Int) -> (String, String)
}

protocol RatingViewControllerInput: AnyObject {
    func reloadNotes()
}
