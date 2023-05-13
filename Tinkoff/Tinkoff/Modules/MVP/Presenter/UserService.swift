import UIKit
import CoreData

protocol UserServiceProtocol  {
    
    func saveUser(name: String, balanceString: String,isAuth: Bool) throws -> RAWUser
    func fetchUsers() throws -> [RAWUser]
}
enum UserError: Error {
    case invalidBalance
    case invalidUsername
}
class UserService: UserServiceProtocol {
    
    func saveUser(name: String, balanceString: String, isAuth:Bool) throws -> RAWUser {
        guard let balance = Int(balanceString) else {
            throw UserError.invalidBalance
        }
        var isAuth: Bool
        let user: User?
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            request.predicate = NSPredicate(format: "name == %@", name)
            
            user = User(context: context)
            user?.name = name
            user?.balance = Int64(balance)
            try context.save()
        } catch {
            throw UserError.invalidBalance
        }
        guard let userName = user?.name, let userBalance = user?.balance else {
            throw UserError.invalidBalance
        }
        return RAWUser(name: userName, balance: Int(userBalance))
        
    }
    
    private func managedObjectContext() -> NSManagedObjectContext {
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
        else {
            fatalError("Couldnt reload data")
        }
        return appDelegate.persistentContainer.viewContext
    }
    func fetchUsers() throws -> [RAWUser] {
        let users = try managedObjectContext().fetch(User.fetchRequest())
        let rawUsers = users.map { user in
            RAWUser.init(name: user.name ?? "Default name", balance: Int(user.balance))
        }
        return rawUsers
    }
}
