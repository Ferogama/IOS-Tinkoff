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
        let vc = FirstViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
}

extension FlowCoordinator: FirstViewControllerOutput {
    func moveToSecondScreen() {
        let vc = SecondViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
extension FlowCoordinator:SecondViewControllerOutput {
    func moveBack() {
        navigationController.popViewController(animated: true)
    }
}
