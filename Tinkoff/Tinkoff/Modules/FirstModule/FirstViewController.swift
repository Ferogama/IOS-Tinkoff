import UIKit

class FirstViewController: UIViewController {
    weak var coordinator:FirstViewControllerOutput?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customBackgroundColor = UIColor(red: 71/255, green: 61/255, blue: 139/255, alpha: 1.0)
        self.view.backgroundColor = customBackgroundColor
        addAddRefreshButton()
        addNameLabel()
        addBalanceLabel()
        showImage()
    
        
    }
    
    func addAddRefreshButton() {
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
    
    func addNameLabel() {
        let nameLabel = UILabel()
        nameLabel.text = ""
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90 ),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 270 ),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
    
    func addBalanceLabel() {
        let balanceLabel = UILabel()
        balanceLabel.text = ""
        view.addSubview(balanceLabel)
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120 ),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 270 ),
            balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
    
    func showImage() {
        let logoImage = UIImage(named: "Logo")
        let imageView = UIImageView()
        imageView.image = logoImage
        //imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 150),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
        ])
    }
    
    @objc func buttonDidTap(_ sender: UIButton) {
        coordinator?.moveToSecondScreen()
        print("he want to play,ahhah")
    }
}

