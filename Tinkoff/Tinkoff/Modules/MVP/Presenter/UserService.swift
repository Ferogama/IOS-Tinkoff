import UIKit
import CoreData

protocol UserServiceProtocol  {
    
    func saveUser(name: String, balanceString: String) throws -> RAWUser
}
enum UserError: Error {
    case invalidBalance
    case invalidUsername
}
class UserService: UserServiceProtocol {
   
    func saveUser(name: String, balanceString: String) throws -> RAWUser {
        guard let balance = Int(balanceString) else {
            throw UserError.invalidBalance
        }
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

}
