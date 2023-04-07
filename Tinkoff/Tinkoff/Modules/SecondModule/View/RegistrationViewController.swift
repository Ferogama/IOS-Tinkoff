import Foundation
import UIKit

class RegistrationViewController: UIViewController, UserViewProtocol {
    
    var presenter: RegistrationViewControllerOutput
    init(presenter: RegistrationViewControllerOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: view properties
    
    private var userField = UITextField()
    private let registerButton = UIButton()
    
    // MARK: Поля
    
    var nameLabel = UILabel()
    var balanceLabel = UILabel()
    
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
    
    // MARK: Placeholder
    func setupField() {
        userField.placeholder = "Enter your name"
        userField.borderStyle = .roundedRect
        view.addSubview(userField)
        
        userField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            userField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50 ),
            userField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    // MARK: RegisterButton
    @objc func registerUser() {
        guard let name = userField.text else {
            return
        }
        presenter.didTapSave(userName: name)

    }

    func setupRegisterButton() {
        
        registerButton.backgroundColor = UIColor(named: "customBackgroundColor")
        registerButton.layer.cornerRadius = 15
        registerButton.layer.borderWidth = 2.0
        registerButton.layer.borderColor = UIColor.white.cgColor
        registerButton.setTitleColor(UIColor .white, for: .normal)
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        view.addSubview(registerButton)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: userField.bottomAnchor, constant: 16 ),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            registerButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    // MARK: <- Button
    @objc func didTapBackButton() {
        presenter.didTapBackButton()
    }
    
    // MARK: ALERTS
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
