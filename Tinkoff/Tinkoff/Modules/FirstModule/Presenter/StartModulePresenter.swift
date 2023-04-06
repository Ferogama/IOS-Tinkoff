//MARK: presenter для начального экрана.Описывает методы
import UIKit

final class StartModulePresenter {

    weak var view: StartViewControllerInput?
    weak var moduleOutput: StartModuleOutput?

    init(
        view: StartViewControllerInput? = nil,
        moduleOutput: StartModuleOutput
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
