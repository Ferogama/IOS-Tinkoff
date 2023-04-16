//MARK: presenter для начального экрана.
import UIKit

final class StartModulePresenter {

    weak var view: StartViewControllerInput?
    weak var moduleOutput: StartModuleOutput?

    init(
        view: StartViewControllerInput? = nil,
        moduleOutput: StartModuleOutput,
        output:StartModuleOutput
    ) {
        self.view = view
        self.moduleOutput = moduleOutput
    
    }
}

extension StartModulePresenter: StartViewControllerOutput {
        
    func didTapPlay() {
        moduleOutput?.moveToSecondScreen()
    }

    func viewDidLoad() {
        view?.showImage(image: UIImage(named: "logo"))
    }
}
