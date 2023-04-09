import Foundation
import UIKit

class RegistrationViewController: UIViewController, UserViewProtocol, UITableViewDelegate, UITableViewDataSource {

    var numbers: [String] = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen"]
    
    var presenter: RegistrationViewControllerOutput
    init(presenter: RegistrationViewControllerOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView:UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    // MARK: view properties
    
    let nameText:String = "Username:"
    let balanceText:String = "Balance:"
    
    let customBackgroundColor = UIColor(red: 72/255, green: 61/255, blue: 139/255, alpha: 1.0)
    
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
        addNameLabel()
        addBalanceLabel()
        tableViewReloading()
        
    }
    private func setupViews() {
        
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
        nameLabel.text = name
        presenter.didTapSave(userName: name)
        //presenter.didTapBackButton()

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
    func addNameLabel() {
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 270),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
    
    func addBalanceLabel() {
        
        balanceLabel.text = ""
        view.addSubview(balanceLabel)
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 270),
            balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
    func tableViewReloading() {
        
        // Установить делегат и источник данных для таблицы
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.backgroundColor = customBackgroundColor
        
        
        // Добавить таблицу в главное окно
        view.addSubview(tableView)
        
        // Обновить таблицу
        tableView.reloadData()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -90),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
//            tableView.widthAnchor.constraint(equalToConstant: 120),
            tableView.heightAnchor.constraint(equalToConstant: 450)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(numbers[indexPath.row])"
        return cell
    }
}
