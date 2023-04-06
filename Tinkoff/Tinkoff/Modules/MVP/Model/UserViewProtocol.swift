
import Foundation

protocol UserViewProtocol: AnyObject {
    var presenter: UserPresenterProtocol? { get set }
    func showAlert(title: String, message: String)
    func showUserData(name: String, balance: Int)
}
