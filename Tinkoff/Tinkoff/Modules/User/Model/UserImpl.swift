import UIKit
import CoreData

protocol UserView: NSObjectProtocol {
    func showAlert(message: String)
    func setName(name: String)
    func setBalance(balance: Double)
}

class UserPresenterImpl: UserPresenter {
    fileprivate let userView: UserView
    fileprivate let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init(view: UserView) {
        self.userView = view
    }
    
    func saveUser(name: String) {
        guard !name.isEmpty else {
            userView.showAlert(message: "Name can't be empty")
            return
        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "name = %@", name)
        let count = try! context.count(for: fetchRequest)
        
        if count > 0 {
            userView.showAlert(message: "Name already exists in database")
            return
        }
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        newUser.setValue(name, forKey: "name")
        newUser.setValue(0.0, forKey: "balance")
        do {
            try context.save()
        } catch {
            userView.showAlert(message: "Save Failed")
        }
    }
    
    func getUser() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let users = try! context.fetch(fetchRequest) as! [NSManagedObject]
        if let currentUser = users.first {
            let name = currentUser.value(forKey: "name") as! String
            let balance = currentUser.value(forKey: "balance") as! Double
            userView.setName(name: name)
            userView.setBalance(balance: balance)
        }
    }
}

