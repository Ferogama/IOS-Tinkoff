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
    func startPlaying() {
        view?.startMusic()
        
    }
    func finishPlaying() {
        view?.stopMusic()
    }
    
    func dappedPlayButton() {
        moduleOutput?.play()
        
    }
    
    
        
    func didTapRegister() {
        moduleOutput?.moveToSecondScreen()
    }

    func viewDidLoad() {
        view?.showImage(image: UIImage(named: "logo"))
        
    }
}
extension StartModulePresenter: StartModuleInput {
    func registeredUser(name: String, balance: Int) {
        view?.showName(name: name, balance: balance)
    }
}
