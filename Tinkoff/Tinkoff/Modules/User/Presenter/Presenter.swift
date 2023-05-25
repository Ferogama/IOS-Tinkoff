
import UIKit
import CoreData

protocol View: AnyObject {
    func showUser(name: String, balance: Int)
    func showUserExistsAlert()
}

class Presenter {

    var view: View?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    init(view: View) {
        self.view = view
    }

    func registerUser(name: String) {

        if let existingUser = fetchUser(name: name) {
            view?.showUserExistsAlert()
            return
        }

        let newUser = User(context: context)
        newUser.name = name
        newUser.balance = 0

        do {
            try context.save()
            view?.showUser(name: newUser.name ?? "", balance: Int(newUser.balance))
        } catch {
            print(error.localizedDescription)
        }
    }

    func fetchUser(name: String) -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        let users = try? context.fetch(fetchRequest)
        return users?.first
    }

}

