import Foundation
import CoreData

protocol RegistrationViewControllerOutput: AnyObject {
    func didTapBackButton()
    func didTapSave(userName: String)
    func coreDataLoad()
}

protocol RegistrationViewControllerInput: AnyObject {
    func managedObjectContext() -> NSManagedObjectContext
    func reloadNotes()
}
