

import Foundation

import UIKit

class ResultsViewController: UIViewController {
    var score: Int
    
    var presenter: ResultViewControllerOutput
    
    init(presenter: ResultViewControllerOutput, score: Int) {
        self.presenter = presenter
        self.score = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var infoLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        createStartButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self, action: nil
        )
        createLabel()
    }
    
    @objc func startGame() {
        presenter.startAgain()
    }
    
    func createLabel() {
        infoLabel.center = view.center
        infoLabel.text = "Ты выиграл!"
        infoLabel.textColor = UIColor.white
        infoLabel.font = UIFont.systemFont(ofSize: 35)
        infoLabel.textAlignment = .center
        
        view.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }

    func createStartButton() {
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
}
