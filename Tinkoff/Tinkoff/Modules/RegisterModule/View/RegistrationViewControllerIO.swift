import Foundation
import CoreData

protocol RegistrationViewControllerOutput: AnyObject {
    func didTapBackButton()
    func didTapSave(userName: String, balanceString: Int)
    func viewDidLoad()
    func didTapCell(indexPath: Int)
    func cellsCount() -> Int
    //тупл
    func data(for index: Int) -> (String, String)
}

protocol RegistrationViewControllerInput: AnyObject {
    func reloadNotes()
}
