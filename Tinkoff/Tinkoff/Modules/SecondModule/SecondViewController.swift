import Foundation
import UIKit

class SecondViewController: UIViewController, UserViewProtocol {
    weak var coordinator: SecondViewControllerOutput?
    
    var presenter: UserPresenterProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupField()
        setupRegisterButton()
    }
    private func setupViews() {
        let customBackgroundColor = UIColor(red: 72/255, green: 61/255, blue: 139/255, alpha: 1.0)
        view.backgroundColor = customBackgroundColor
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "←",
            style: .plain,
            target: self,
            action: #selector(didTapBackButton)
        )
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    func setupField() {
        //Поле
        let userField = UITextField()
        userField.placeholder = "Enter your name"
        userField.borderStyle = .roundedRect
        view.addSubview(userField)
        
        userField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50 ),
            userField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    @objc func registerUser() {
        
        coordinator?.moveBack()
    }
    
    
    func setupRegisterButton() {
        //register button
        let registerButton = UIButton()
        registerButton.backgroundColor = UIColor(named: "customBackgroundColor")
        registerButton.layer.cornerRadius = 15
        registerButton.layer.borderWidth = 2.0
        registerButton.layer.borderColor = UIColor.white.cgColor
        registerButton.setTitleColor(UIColor .white, for: .normal)
        registerButton.setTitle("Register", for: .normal)
        view.addSubview(registerButton)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450 ),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 250 ),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
        
    }
    
    @objc func didTapBackButton() {
        coordinator?.moveBack()
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func showUserData(name: String, balance: Int) {
        let message = "Name: \(name)\nBalance: \(balance)"
        showAlert(title: "User data", message: message)
    }
}

