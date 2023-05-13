

import UIKit

final class RegistrationModulePresenter {

    weak var view: RegistrationViewControllerInput?
    
    var users:[RAWUser] = []
    
    private let service: UserServiceProtocol
   
    weak var registrationModuleOutput: RegistrationModuleOutput?
    

    init(
        
        view: RegistrationViewControllerInput? = nil,
        registrationModuleOutput: RegistrationModuleOutput,
        service: UserServiceProtocol
    ) {
        self.view = view
        self.registrationModuleOutput = registrationModuleOutput
        self.service = service
    }
}

extension RegistrationModulePresenter: RegistrationViewControllerOutput {

    
    func cellsCount() -> Int {
        users.count
    }
    
    func data(for index: Int) -> (String, String) {
        return (users[index].name, "\(users[index].balance)")
    }
    
    
    
    func didTapBackButton() {
        registrationModuleOutput?.moveBack()
    }
    
    func didTapSave(userName: String, balanceString: Int, isAuth: Bool) {
        do {
            try service.saveUser(name: userName, balanceString: "0", isAuth: true)
            users = try service.fetchUsers()
            view?.reloadNotes()
            registrationModuleOutput?.registered(name: userName, balance: balanceString, isAuth: true)
            
        } catch {
            print("alba")
        }
    }
    func viewDidLoad() {
        do {
            users = try service.fetchUsers()
            view?.reloadNotes()
        } catch {
            print("some error")
        }
    }
}
