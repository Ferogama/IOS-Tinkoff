

import UIKit

final class RatingModulePresenter {

    weak var view: RatingViewControllerInput?
    
    var users:[RAWUser] = []
    
    private let service: UserServiceProtocol
   
    weak var moduleOutput: RatingModuleOutput?
    

    init(
        
        view: RatingViewControllerInput? = nil,
        moduleOutput: RatingModuleOutput,
        service: UserServiceProtocol
    ) {
        self.view = view
        self.moduleOutput = moduleOutput
        self.service = service
    }
}

extension RatingModulePresenter: RatingViewControllerOutput {
    func didTapBackButton() {
        moduleOutput?.moveToRootScreen()
    }
    
    func data(for index: Int) -> (String, String) {
        //return (users[index].name, "\(users[index].balance)")
        return("", "")
    }
}
