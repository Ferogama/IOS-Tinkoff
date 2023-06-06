

import Foundation
import UIKit

class GameOverController: UIViewController {
    var score: Int
    var statusLabel = UILabel()
    var presenter: GameOverViewControllerOutput
    init(presenter: GameOverViewControllerOutput, score: Int) {
        self.presenter = presenter
        self.score = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self, action: nil
        )
        crateStartButton()
        createStatusLabel()
    }
    
    @objc private func startGame() {
        presenter.startPlaying()
    }
    
    private func crateStartButton() {
        let scoreLabel = UILabel()
        scoreLabel.text = "Ваш счет: \(score)"
        scoreLabel.textColor = UIColor.white
        scoreLabel.font = UIFont.systemFont(ofSize: 25)
        scoreLabel.textAlignment = .center
        scoreLabel.center = view.center
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let startAgainButton = UIButton(type: .system)
        startAgainButton.setTitle("Начать заново", for: .normal)
        startAgainButton.backgroundColor = .white
        startAgainButton.setTitleColor(UIColor .black, for: .normal)
        startAgainButton.layer.cornerRadius = 15
        startAgainButton.layer.borderWidth = 2.0
        startAgainButton.layer.borderColor = UIColor.black.cgColor
        startAgainButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        
        view.addSubview(startAgainButton)
        startAgainButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startAgainButton.bottomAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 60),
            startAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            startAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
    
    private func createStatusLabel() {
        statusLabel.center = view.center
        statusLabel.text = "Вы проиграли!"
        statusLabel.textColor = UIColor.white
        statusLabel.font = UIFont.systemFont(ofSize: 35)
        statusLabel.textAlignment = .center
        
        view.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
