
import Foundation

protocol UserViewProtocol: AnyObject {
    
    func showAlert(title: String, message: String)
    func showUserData(name: String, balance: Int)
}
