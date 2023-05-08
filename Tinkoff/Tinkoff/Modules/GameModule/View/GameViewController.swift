
import UIKit

class GameViewController: UIViewController {
    
    var presenter: GameViewControllerOutput?
    var currentQuestionIndex = 0
    var score = 100
    //var usedQuestionIndexes = [Int]()
    let customBackgroundColor = UIColor(red: 72/255, green: 61/255, blue: 139/255, alpha: 1.0)
    let buttonBackgroundColor = UIColor(red: 136/255, green: 204/255, blue: 213/255, alpha: 1.0)
    let correctAnswerColor = UIColor(red: 103/255, green: 236/255, blue: 139/255, alpha: 1.0)
    let wrongAnswerColor = UIColor(red: 236/255, green: 103/255, blue: 103/255, alpha: 1.0)
    
    var questionLabel = UILabel()
    var answersButtons = [UIButton]()
    var questions = [Question]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBackgroundColor
        createQuestions()
        customizeAllButtons()
        customizeQuestions()
        displayQuestion()
    }
    
    func createQuestions() {
        questions.append(Question(questionText: "Какую фамилию носил главный герой поэмы А. Твардовского?", answers: ["Тёркин", "Мишустин", "Путин", "Балайкин"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Как часто называют человека, который не реагируют на чужие переживания?", answers: ["Лепеша", "Галета", "Пряник", "Сухарь"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Кого согласно поговрке, берут за рога, смело приступая к делу?", answers: ["Барана", "Быка", "Мужа", "Лося"], correctAnswerIndex: 1))
        questions.append(Question(questionText: "Что англичане традиционно делают в 5 часов вечера?", answers: ["Ложатся спать", "Обедают", "Пьют чай", "Поют гимн"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Как называется столица Франции?", answers: ["Париж", "Квебек", "Астана", "Альмуалим"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Сколько восьминогих у осьминога?", answers: ["5", "9", "8", "3"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Как называется собака из мультфильма 'Том и Джерри'", answers: ["Спрайт", "Найт", "Вайт", "Спайк"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Сколько планет в солнечной системе?", answers: ["6", "5", "8", "3"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Какое имя у главного героя романа 'Преступление и наказание' ", answers: ["Родион", "Дмитрий", "Георгий", "Александр"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "В каком году началась Первая Мировая война?", answers: ["1915", "1941", "1919", "1914"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Какой элемент в периодической таблице имеет атомный номер 1?", answers: ["Водород", "Кислород", "Гелий", "Уран"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Какой цветок символизирует Рождество?", answers: ["Елка", "Звезда", "Мишура", "Подарки"], correctAnswerIndex: 1))
        questions.append(Question(questionText: "Сколько клавиш на пианино?", answers: ["80", "32", "120", "88"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Какая планета является самой близкой к Солнцу?", answers: ["Уран", "Нептун", "Меркурий", "Марс"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Как называется женский герой в пьесе Вильяма Шекспира 'Гамлет'?", answers: ["Офелия", "Амелия", "Алина", "Глина"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Какой год считается годом основания Рима?", answers: ["750", "879", "753", "211"], correctAnswerIndex: 2))

        questions.shuffle()
        //presenter?.loadScreen()
    }
    
    func customizeQuestions() {
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: 25)
        questionLabel.numberOfLines = 0
        questionLabel.backgroundColor = customBackgroundColor
        questionLabel.layer.borderColor = UIColor.white.cgColor
        questionLabel.layer.borderWidth = 2
        questionLabel.layer.cornerRadius = 30
        questionLabel.textColor = .white
        view.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        for i in 0..<2 {
           let buttonRow = UIStackView()
           buttonRow.axis = .horizontal
           buttonRow.distribution = .fillEqually
           buttonRow.spacing = 20
           
           for _ in 0..<2 {
              let button = UIButton()
              button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
              button.setTitleColor(.black, for: .normal)
              button.layer.cornerRadius = 30
              button.addTarget(self, action: #selector(answerSelected(sender:)), for: .touchUpInside)
              buttonRow.addArrangedSubview(button)
              answersButtons.append(button)
           }
           
           view.addSubview(buttonRow)
           buttonRow.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
              buttonRow.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: CGFloat(i * 100) + 60),
              buttonRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
              buttonRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
              buttonRow.heightAnchor.constraint(equalToConstant: 60)
           ])
        }

    }
    
    func displayQuestion() {
        if currentQuestionIndex > 14 || currentQuestionIndex >= questions.count {
            return
        }

      
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.questionText
          
        for i in 0..<currentQuestion.answers.count {
            answersButtons[i].setTitle(currentQuestion.answers[i], for: .normal)
            answersButtons[i].backgroundColor = buttonBackgroundColor
        }
    }


    
    @objc func answerSelected(sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        if sender.currentTitle == currentQuestion.answers[currentQuestion.correctAnswerIndex] {
            score *= 2
            sender.backgroundColor = correctAnswerColor
            print(score)
        } else {
            sender.backgroundColor = wrongAnswerColor
        
            //let gameOverController = GameOverController(score: score)
            //UIApplication.shared.keyWindow?.rootViewController = gameOverController
            print("UR score is:" + "\(score)")
            return
        }
        // задержка перед показом следующего вопроса
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.currentQuestionIndex < self.questions.count - 1 {
                self.currentQuestionIndex += 1
                self.displayQuestion()
            } else {
                //let resultController = ResultsViewController()
                //UIApplication.shared.keyWindow?.rootViewController = resultController
                self.displayQuestion()
            }
        }
    }

    
    func customizeAllButtons() {
        let allButtons: [UIButton] = [/* add all buttons you have here */]
        for button in allButtons {
            button.backgroundColor = buttonBackgroundColor
            button.layer.cornerRadius = 10
            button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
            button.setTitleColor(.black, for: .normal)
        }
    }
}
extension GameViewController: GameViewControllerInput {
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
        
    func showQuestions() {
        var questions = [Question]()
        questions.append(Question(questionText: "Какую фамилию носил главный герой поэмы А. Твардовского?", answers: ["Тёркин", "Мишустин", "Путин", "Балайкин"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Как часто называют человека, который не реагируют на чужие переживания?", answers: ["Лепеша", "Галета", "Пряник", "Сухарь"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Кого согласно поговрке, берут за рога, смело приступая к делу?", answers: ["Барана", "Быка", "Мужа", "Лося"], correctAnswerIndex: 1))
        questions.append(Question(questionText: "Что англичане традиционно делают в 5 часов вечера?", answers: ["Ложатся спать", "Обедают", "Пьют чай", "Поют гимн"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Как называется столица Франции?", answers: ["Париж", "Квебек", "Астана", "Альмуалим"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Сколько восьминогих у осьминога?", answers: ["5", "9", "8", "3"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Как называется собака из мультфильма 'Том и Джерри'", answers: ["Спрайт", "Найт", "Вайт", "Спайк"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Сколько планет в солнечной системе?", answers: ["6", "5", "8", "3"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Какое имя у главного героя романа 'Преступление и наказание' ", answers: ["Родион", "Дмитрий", "Георгий", "Александр"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "В каком году началась Первая Мировая война?", answers: ["1915", "1941", "1919", "1914"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Какой элемент в периодической таблице имеет атомный номер 1?", answers: ["Водород", "Кислород", "Гелий", "Уран"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Какой цветок символизирует Рождество?", answers: ["Елка", "Звезда", "Мишура", "Подарки"], correctAnswerIndex: 1))
        questions.append(Question(questionText: "Сколько клавиш на пианино?", answers: ["80", "32", "120", "88"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Какая планета является самой близкой к Солнцу?", answers: ["Уран", "Нептун", "Меркурий", "Марс"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Как называется женский герой в пьесе Вильяма Шекспира 'Гамлет'?", answers: ["Офелия", "Амелия", "Алина", "Глина"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Какой год считается годом основания Рима?", answers: ["750", "879", "753", "211"], correctAnswerIndex: 2))
       
        questions.shuffle()
    }
}

