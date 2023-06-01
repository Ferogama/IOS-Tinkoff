

import Foundation

final class GameOverModulePresenter {

    weak var moduleOutput: GameOverModuleOutput?

    init(
       
        moduleOutput: GameOverModuleOutput
       
    ) {
    
        self.moduleOutput = moduleOutput
    
    }
}

extension GameOverModulePresenter: GameOverViewControllerOutput {
    func startPlaying() {
        moduleOutput?.moveToStartPage()
    }
}
