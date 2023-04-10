import UIKit

class StartViewController: UIViewController {
    
    var presenter: StartViewControllerOutput?
    
    var nameLabel = UILabel()
    var balanceLabel = UILabel()
    
    let customBackgroundColor = UIColor(red: 71/255, green: 61/255, blue: 139/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = customBackgroundColor
        addPlayButton()
        addNameLabel()
        addBalanceLabel()
        presenter?.viewDidLoad()
    }
    
    //MARK: Play Button
    
    func addPlayButton() {
        let playButton = UIButton()
        playButton.backgroundColor = .black
        playButton.layer.cornerRadius = 15
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        view.addSubview(playButton)
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 250),
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
    
    //MARK: Labels
    
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
    
    @objc private func buttonDidTap(_ sender: UIButton) {
        presenter?.didTapPlay()
    }
}

extension StartViewController: StartViewControllerInput {
    func showImage(image: UIImage?) {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 128),
            imageView.heightAnchor.constraint(equalToConstant: 128)
        ])
    }
}
