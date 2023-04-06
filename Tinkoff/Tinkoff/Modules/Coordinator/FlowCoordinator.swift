import UIKit

protocol FlowCoordinatorProtocol {
    func start()
    func finish()
}
class FlowCoordinator: FlowCoordinatorProtocol {
    
    var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = StartViewController()
        let presenter = StartModulePresenter(view: vc, moduleOutput: self)
        vc.presenter = presenter
        navigationController.pushViewController(vc, animated: false)
    }
    func finish() {
        navigationController.popViewController(animated: true)
    }
}

extension FlowCoordinator: StartModuleOutput {
    func moveToSecondScreen() {
        let vc = RegistrationViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
extension FlowCoordinator: RegistrationViewControllerOutput {
    func moveBack() {
        navigationController.popViewController(animated: true)
    }
}
