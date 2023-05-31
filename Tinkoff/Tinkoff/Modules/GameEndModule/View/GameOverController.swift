

import Foundation
import UIKit

class GameOverController: UIViewController {
    var score: Int = 100
    
    var presenter: GameOverViewControllerOutput
    
    init(presenter: GameOverViewControllerOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        crateStartButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self, action: nil
        )
    }

    @objc func startGame() {
        presenter.startPlaying()
    }
    
    
    func crateStartButton() {
        let scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        scoreLabel.text = "Ваш счет: \(score)"
        scoreLabel.textColor = UIColor.white
        scoreLabel.font = UIFont.systemFont(ofSize: 20)
        scoreLabel.textAlignment = .center
        scoreLabel.center = view.center
        view.addSubview(scoreLabel)
        
        let button = UIButton(type: .system)
        button.setTitle("Начать заново", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
}


