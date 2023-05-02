import UIKit

class StartViewController: UIViewController {
    
    var presenter: StartViewControllerOutput?
    
    var nameLabel = UILabel()
    var balanceLabel = UILabel()
    let registerButton = UIButton()
    let customBackgroundColor = UIColor(red: 72/255, green: 61/255, blue: 139/255, alpha: 1.0)
    var isRegistered:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = customBackgroundColor
        addRegisterButton()
        addNameLabel()
        addBalanceLabel()
        createOthersButtons()
        presenter?.viewDidLoad()
        
        
        
    }
    
    //MARK: (Play Button) ↓
    private func addRegisterButton() {
        registerButton.backgroundColor = .black
        registerButton.layer.borderColor = UIColor.white.cgColor
        registerButton.layer.cornerRadius = 15
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonDidTap), for: .touchUpInside)
        view.addSubview(registerButton)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 250),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    func createPlayButton() {
        let playButton = UIButton(type: .system)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .white
        playButton.transform = CGAffineTransform(scaleX: 4, y: 4)
        playButton.addTarget(self, action: #selector(tappedPlay), for: .touchUpInside)
        
        view.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200 ),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 250),
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    func showRegisterButton() {
        registerButton.isHidden = true
    }
    
    @objc private func tappedPlay() {
        presenter?.dappedPlayButton()
       
    }
    
    @objc private func registerButtonDidTap(_ sender: UIButton) {
        presenter?.didTapPlay()
    }
    
    
    //MARK: (Play Button) ↑
    
    
    //MARK: (LABELS) ↓
    func addNameLabel() {
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    func addBalanceLabel() {
        balanceLabel.textColor = .white
        balanceLabel.textAlignment = .left
        view.addSubview(balanceLabel)
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    //MARK: (LABELS) ↑
    
    private func createOthersButtons() {
        
        let likeButton = UIButton(type: .system)
        likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        likeButton.tintColor = .white
        likeButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        view.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            likeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            likeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -320)
        ])
        
        let volumeButton = UIButton(type: .system)
        volumeButton.setImage(UIImage(systemName: "speaker.wave.2"), for: .normal)
        volumeButton.tintColor = .white
        volumeButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        view.addSubview(volumeButton)
        volumeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            volumeButton.bottomAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: -50),
            volumeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            volumeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -320)
        ])
        
        let topButton = UIButton(type: .system)
        topButton.setImage(UIImage(systemName: "trophy"), for: .normal)
        topButton.tintColor = .white
        topButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        view.addSubview(topButton)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topButton.bottomAnchor.constraint(equalTo: volumeButton.bottomAnchor, constant: -50),
            topButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -320)
        ])
    }
}

extension StartViewController: StartViewControllerInput {
    func showName(name: String, balance: Int) {
        nameLabel.text = "Ussername:" + "" +  name
        balanceLabel.text = "Balance:" + "" + "\(balance)"
        createPlayButton()
        showRegisterButton()
        
    }
    
    func showImage(image: UIImage?) {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 168),
            imageView.heightAnchor.constraint(equalToConstant: 168)
        ])
    }
}
