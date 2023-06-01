import UIKit

protocol FlowCoordinatorProtocol {
    func start()
    func finish()
}
class FlowCoordinator: FlowCoordinatorProtocol {

    var navigationController: UINavigationController!
    private weak var startModuleInput: StartModuleInput?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = StartViewController()
        let presenter = StartModulePresenter(view: vc, moduleOutput: self)
        startModuleInput = presenter
        vc.presenter = presenter
        navigationController.pushViewController(vc, animated: false)
    }
    func finish() {
        navigationController.popViewController(animated: true)
    }
}

extension FlowCoordinator: StartModuleOutput {
    func moveToRatingScreen() {
        
        let presenter = RatingModulePresenter(moduleOutput: self, service: UserService())
        let vc = RatingViewController(presenter: presenter)
        presenter.view = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
 
    func moveToSecondScreen() {
        let presenter = RegistrationModulePresenter(registrationModuleOutput: self, service: UserService())
        let vc = RegistrationViewController(presenter: presenter)
        presenter.view = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveToGameScreen(name: String, balance: Int) {
        let presenter = GameModulePresenter()
        let vc = GameViewController(presenter: presenter, name: name, balance: balance)
        presenter.view = vc
        presenter.gameModuleOutput = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension FlowCoordinator: RegistrationModuleOutput {
    func registered(name: String, balance: Int) {
        moveBack()
        startModuleInput?.registeredUser(name: name, balance: balance)
    }
    
    func moveBack() {
        navigationController.popViewController(animated: true)
    }
}
extension FlowCoordinator: GameModuleOutput {
    func finishGame(score: Int) {
        let presenter = GameOverModulePresenter(moduleOutput: self)
        let vc = GameOverController(presenter: presenter, score: score)
        presenter.moduleOutput = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension FlowCoordinator: GameOverModuleOutput {
    func moveToStartPage() {
        if let navController = self.navigationController {
            navController.popToRootViewController(animated: true)
        }

    }
}
extension FlowCoordinator: RatingModuleOutput {
    func moveToRootScreen() {
        navigationController.popViewController(animated: true)
    }
}
