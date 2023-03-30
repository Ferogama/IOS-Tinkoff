
import CoreData
import Foundation
import UIKit

class UserPresenter {
    private weak var view: UserView?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
      let context = appDelegate.persistentContainer.viewContext
    
    init(view: UserView) {
        self.view = view
    }
    
    // MARK: - Core Data methods
    
    func saveUser(name: String) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        do {
            let users = try managedObjectContext.fetch(fetchRequest)
            if users.count > 0 {
                view?.showError()
                return
            }
            
            let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext)!
            let user = UserInfo(entity: entityDescription, insertInto: managedObjectContext)
            user.name = name
            user.balance = 0.0
            do {
                try managedObjectContext.save()
                view?.showUser(name: name, balance: user.balance)
            } catch {
                print("Unable to save user.")
            }
        } catch {
            print("Unable to fetch users.")
        }
    }
    
    func getUser() -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let users = try managedObjectContext.fetch(fetchRequest)
            return users.first
        } catch {
            print("Unable to fetch users.")
        }
        return nil
    }
}
