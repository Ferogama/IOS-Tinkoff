
import UIKit
import CoreData

final class GameModulePresenter {
    weak var view: GameViewControllerInput?
    weak var gameModuleOutput: GameModuleOutput?
    init(
        view: GameViewControllerInput? = nil
        
    ) {
        self.view = view
    }
}

extension GameModulePresenter: GameViewControllerOutput {
    func saveUserBalanceInCoreData(name: String, score: Int) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Ищем пользователя в CoreData
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", name)
        var user: User?
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                user = results.first
            }
        } catch {
            print("Error fetching User from CoreData: \(error.localizedDescription)")
        }
        user?.balance += Int64(score)
        do {
            try context.save()
            print("User balance saved in CoreData.")
        } catch {
            print("Error saving User balance in CoreData: \(error.localizedDescription)")
        }
    }
    
    func showResultController(userscore: Int) {
        gameModuleOutput?.openResultController(score: userscore)
    }
    
    func finishTheGame(userscore: Int) {
        gameModuleOutput?.finishGame(score: userscore)
    }
    
    func loadScreen() {
        view?.showQuestions()
        view?.showImage(image: UIImage(named: "logo"))
    }
}    
