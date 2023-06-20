import UIKit
import AVFAudio

class StartViewController: UIViewController {
    
    var presenter: StartViewControllerOutput?
    var audio = AVAudioPlayer()
    var nameLabel = UILabel()
    var balanceLabel = UILabel()
    let registerButton = UIButton()
    let customLightBackgroundColor = UIColor(red: 72/255, green: 61/255, blue: 139/255, alpha: 1.0)
    let customBlackBackgroundColor = UIColor(red: 42/255, green: 0/255, blue: 47/255, alpha: 1.0)
    var isRegistered:Bool = false
    let volumeButton = UIButton(type: .system)
    private var isLoggedOut = false
    var logoutButton = UIButton(type: .system)
    let playButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = customLightBackgroundColor
        //setThemes()
        addRegisterButton()
        addNameLabel()
        addBalanceLabel()
        createOthersButtons()
        presenter?.viewDidLoad()
        presenter?.startPlaying()
        
    }
    private func setThemes() {
        self.view.backgroundColor = UIColor {traitCollection in
            UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return self.customBlackBackgroundColor
                default:
                    return self.customLightBackgroundColor
                }
            }
        }
    }
    
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
        playButton.isHidden = false
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
        presenter?.tappedPlayButton()
        
    }
    
    @objc private func registerButtonDidTap() {
        presenter?.didTapRegister()
    }
    
    @objc private func tappedTopButton() {
        presenter?.didTapRatingButton()
    }

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
        
        volumeButton.setImage(UIImage(systemName: "speaker.wave.2"), for: .normal)
        volumeButton.addTarget(self, action: #selector(volumeButtonTapped), for: .touchUpInside)
        
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
        topButton.addTarget(self, action: #selector (tappedTopButton), for: .touchUpInside)
        
        view.addSubview(topButton)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topButton.bottomAnchor.constraint(equalTo: volumeButton.bottomAnchor, constant: -50),
            topButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -320)
        ])
    }
    
    private func createLogoutButton() {
        logoutButton.isHidden = false
        logoutButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        logoutButton.tintColor = .white
        logoutButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    @objc private func logoutButtonTapped() {
        presenter?.didTapLogoutButton()
        
    }
    
    @objc func volumeButtonTapped() {
        if volumeButton.currentImage == UIImage(systemName: "speaker.wave.2") {
            volumeButton.setImage(UIImage(systemName: "volume"), for: .normal)
            presenter?.finishPlaying()
        } else {
            volumeButton.setImage(UIImage(systemName: "speaker.wave.2"), for: .normal)
            presenter?.startPlaying()
        }
    }
}

extension StartViewController: StartViewControllerInput {
    func reloadAfterLogout() {
        nameLabel.text = nil
        balanceLabel.text = nil
        presenter?.viewDidLoad()
        logoutButton.isHidden = true
        playButton.isHidden = true
        registerButton.isHidden = false
        
    }
    
    func showName(name: String, balance: Int) {
        nameLabel.text = "Username: " + name
        balanceLabel.text = "Balance: \(balance)"
        createPlayButton()
        showRegisterButton()
        createLogoutButton()
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
    
    func startMusic() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "mainPage", ofType: "mp3")!))
            audio.prepareToPlay()
        } catch {
            print("Cant load music")
        }
        audio.currentTime = 0
        audio.play()
    }
    
    func stopMusic() {
        audio.stop()
    }
}
