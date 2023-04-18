
import UIKit

class GameViewController: UIViewController {
    
    let customBackgroundColor = UIColor(red: 72/255, green: 61/255, blue: 139/255, alpha: 1.0)
    var questionLabel = UILabel()
    
    var answers: [String] = ["Дома", "На работе", "На учебе", "На отдыхе"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBackgroundColor
        customizeAllButtons()
        customizeQuistions()
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
    
    func customizeAllButtons() {
        let firstAnswerButton = UIButton()
        let secondAnswerButton = UIButton()
        let thirdAnswerButton = UIButton()
        let fourthAnswerButton = UIButton()
        
        firstAnswerButton.backgroundColor = .black
        firstAnswerButton.layer.cornerRadius = 12
        firstAnswerButton.setTitle("A:" + "\(answers[0])", for: .normal)
        firstAnswerButton.titleLabel?.textAlignment = .left
        firstAnswerButton.contentHorizontalAlignment = .left

        firstAnswerButton.addTarget(self, action: #selector(answerA), for: .touchUpInside)
        view.addSubview(firstAnswerButton)
        firstAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstAnswerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            firstAnswerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            firstAnswerButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    
        
        secondAnswerButton.backgroundColor = .black
        secondAnswerButton.layer.cornerRadius = 12
        secondAnswerButton.setTitle("B:" + "\(answers[1])" , for: .normal)
        secondAnswerButton.titleLabel?.textAlignment = .left
        secondAnswerButton.contentHorizontalAlignment = .left
        secondAnswerButton.addTarget(self, action: #selector(answerB), for: .touchUpInside)
        view.addSubview(secondAnswerButton)
        secondAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondAnswerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            secondAnswerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            secondAnswerButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        
        thirdAnswerButton.backgroundColor = .black
        thirdAnswerButton.layer.cornerRadius = 12
        thirdAnswerButton.setTitle("C:" + "\(answers[2])"  , for: .normal)
        thirdAnswerButton.addTarget(self, action: #selector(answerC), for: .touchUpInside)
        thirdAnswerButton.titleLabel?.textAlignment = .left
        thirdAnswerButton.contentHorizontalAlignment = .left
        view.addSubview(thirdAnswerButton)
        thirdAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdAnswerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -125),
            thirdAnswerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            thirdAnswerButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        fourthAnswerButton.backgroundColor = .black
        fourthAnswerButton.layer.cornerRadius = 12
        fourthAnswerButton.setTitle("D:" + "\(answers[3])" , for: .normal)
        fourthAnswerButton.titleLabel?.textAlignment = .left
        fourthAnswerButton.contentHorizontalAlignment = .left
        
        fourthAnswerButton.addTarget(self, action: #selector(answerD), for: .touchUpInside)
        view.addSubview(fourthAnswerButton)
        fourthAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fourthAnswerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -125),
            fourthAnswerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            fourthAnswerButton.widthAnchor.constraint(equalToConstant: 100)
        
        ])
            
    }
    
    @objc private func didTapBackButton() {
        
    }
    
    @objc private func answerA() {
        print("ответ не верный")
    }
    
    @objc private func answerB() {
        print("ответ не верный")
    }
    
    @objc private func answerC() {
        print("ответ не верный")
    }
    
    @objc private func answerD() {
        print("Правильно")
    }
    
    func customizeQuistions() {
        questionLabel.text = "Угадай где я"
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: 27)
        view.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
}
