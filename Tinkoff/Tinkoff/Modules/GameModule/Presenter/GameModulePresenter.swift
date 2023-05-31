
import UIKit

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
    func finishTheGame() {
        gameModuleOutput?.finishGame()
          

    }
    
    func loadScreen() {
        view?.showQuestions()
        view?.showImage(image: UIImage(named: "logo"))
        view?.playMusic()
    }
}    
