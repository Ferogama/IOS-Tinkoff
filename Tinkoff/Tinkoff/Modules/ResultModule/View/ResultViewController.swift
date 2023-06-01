

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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        crateStartButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self, action: nil
        )
    }

    @objc func startGame() {
        presenter.startAgain()
    }
    
    
    func crateStartButton() {
        let scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        scoreLabel.center = view.center
        scoreLabel.text = "Ваш счет: \(score)"
        scoreLabel.textColor = UIColor.white
        scoreLabel.font = UIFont.systemFont(ofSize: 25)
        scoreLabel.textAlignment = .center
        scoreLabel.center = view.center
        view.addSubview(scoreLabel)
        
        let button = UIButton(type: .system)
        button.setTitle("Начать заново", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor .black, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
}


