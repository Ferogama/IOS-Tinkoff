
import UIKit

final class GameModulePresenter {

    weak var view: GameViewControllerInput?
    

    init(
        view: GameViewControllerInput? = nil
    ) {
        self.view = view
    }
}

extension GameModulePresenter: GameViewControllerOutput {
    func loadScreen() {
        view?.showQuestions()
        view?.showImage(image: UIImage(named: "logo"))
    }
}    
