import UIKit
import CoreData

protocol UserPresenterProtocol {
    var view: UserViewProtocol? { get set }
    func viewDidLoad()
    func registerButtonTapped(name: String, balanceString: String)
}

class UserPresenter: UserPresenterProtocol {
    weak var view: UserViewProtocol?
    private let userService: StorageServiceProtocol

    init(view: UserViewProtocol? = nil, userService: StorageServiceProtocol) {
        self.view = view
        self.userService = userService
    }
    
    func viewDidLoad() {}
    
    func registerButtonTapped(name: String, balanceString: String) {
        guard let balance = Int(balanceString) else {
            view?.showAlert(title: "Error", message: "Invalid balance")
            return
        }
        let user: User?
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            request.predicate = NSPredicate(format: "name == %@", name)
            let result = try context.fetch(request) as! [User]
            if !result.isEmpty {
                view?.showAlert(title: "Error", message: "User with such a name is already registered")
                return
            }
            user = User(context: context)
            user?.name = name
            user?.balance = Int64(balance)
            try context.save()
        } catch {
            view?.showAlert(title: "Error", message: "Failed to save data")
            return
        }
        guard let userName = user?.name, let userBalance = user?.balance else {
            view?.showAlert(title: "Error", message: "Failed to retrieve user data")
            return
        }
        view?.showUserData(name: userName, balance: Int(userBalance))
    }
}
