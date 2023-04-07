

import UIKit

final class RegistrationModulePresenter {

    private let service: UserServiceProtocol
   
    weak var registrationModuleOutput: RegistrationModuleOutput?
    

    init(
        
        registrationModuleOutput: RegistrationModuleOutput,
        service: UserServiceProtocol
    ) {
        
        self.registrationModuleOutput = registrationModuleOutput
        self.service = service
    }
}

extension RegistrationModulePresenter: RegistrationViewControllerOutput {
    func didTapBackButton() {
        registrationModuleOutput?.moveBack()
    }
    func didTapSave(userName: String) {
        
        do {
            try service.saveUser(name: userName, balanceString: "0")
        } catch {
            print("alba")
            print(error)
        }
    }
}
