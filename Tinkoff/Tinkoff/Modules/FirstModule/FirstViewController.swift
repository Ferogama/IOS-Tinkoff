import UIKit

class FirstViewController: UIViewController {
    weak var coordinator:FirstViewControllerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customBackgroundColor = UIColor(red: 71/255, green: 61/255, blue: 139/255, alpha: 1.0)
        self.view.backgroundColor = customBackgroundColor
        addAndRefreshButton()
        setupView()
    }
    
    func addAndRefreshButton() {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        print(button)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300 ),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 250 ),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
        
    func setupView() {
            //logo
        let logo = UIImageView()
        //logo.image = UIImage(named: "Logo")
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    func addLabel() {
        
    }
    
    @objc func buttonDidTap(_ sender: UIButton) {
        coordinator?.moveToSecondScreen()
        print("fff")
    }
}
