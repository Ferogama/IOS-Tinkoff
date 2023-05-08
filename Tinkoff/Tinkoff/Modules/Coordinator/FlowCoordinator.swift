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
        let presenter = StartModulePresenter(view: vc, moduleOutput: self, output: self)
        startModuleInput = presenter
        vc.presenter = presenter
        navigationController.pushViewController(vc, animated: false)
    }
    func finish() {
        navigationController.popViewController(animated: true)
    }
}

extension FlowCoordinator: StartModuleOutput {
    func moveToSecondScreen() {
        let presenter = RegistrationModulePresenter(registrationModuleOutput: self, service: UserService())
        let vc = RegistrationViewController(presenter: presenter)
        presenter.view = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
    func registered(name: String, balance: Int) {
        moveBack()
        startModuleInput?.registeredUser(name: name, balance: balance)
    }
    func play() {
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
extension FlowCoordinator: RegistrationModuleOutput {
    func moveBack() {
        navigationController.popViewController(animated: true)
    }
    
}
