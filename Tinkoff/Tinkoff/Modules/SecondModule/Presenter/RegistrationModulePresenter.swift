

import UIKit

final class RegistrationModulePresenter {

    weak var data: RegistrationViewControllerInput?
    
    private let service: UserServiceProtocol
   
    weak var registrationModuleOutput: RegistrationModuleOutput?
    

    init(
        
        data: RegistrationViewControllerInput? = nil,
        registrationModuleOutput: RegistrationModuleOutput,
        service: UserServiceProtocol
    ) {
        self.data = data
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
        }
    }
    func coreDataLoad() {
        data?.reloadNotes()
        data?.managedObjectContext()
    }
}
