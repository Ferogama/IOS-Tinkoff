//MARK: presenter для начального экрана.
import UIKit

final class StartModulePresenter {
    private var name: String?
    private var balance: Int?
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
    func didTapLogoutButton() {
        view?.reloadAfterLogout()
    }
    
    func startPlaying() {
        view?.startMusic()
        
    }
    
    func finishPlaying() {
        view?.stopMusic()
    }
    
    func tappedPlayButton() {
        guard let name = name, let balance = balance else {return}
        moduleOutput?.moveToGameScreen(name: name, balance: balance)
    }
    
    func didTapRatingButton() {
        moduleOutput?.moveToRatingScreen()
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
        self.name = name
        self.balance = balance
    }
}
