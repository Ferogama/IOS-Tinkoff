
import UIKit
import AVFoundation
import CoreData

class GameViewController: UIViewController {
    var score = 1
    
    var name: String
    var balance: Int
    
    var presenter: GameViewControllerOutput
    
    init(presenter: GameViewControllerOutput, name: String, balance: Int) {
        self.presenter = presenter
        self.name = name
        self.balance = balance
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var currentQuestionIndex = 0
    
    let customBackgroundColor = UIColor(red: 72/255, green: 61/255, blue: 139/255, alpha: 1.0)
    let buttonBackgroundColor = UIColor(red: 136/255, green: 204/255, blue: 213/255, alpha: 1.0)
    let correctAnswerColor = UIColor(red: 103/255, green: 236/255, blue: 139/255, alpha: 1.0)
    let wrongAnswerColor = UIColor(red: 236/255, green: 103/255, blue: 103/255, alpha: 1.0)
    let questionNumberLabel = UILabel()
    var questionLabel = UILabel()
    let scoreLabel = UILabel()
    var answersButtons = [UIButton]()
    var questions = [Question]()
    var audio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBackgroundColor
        createQuestions()
        customizeAllButtons()
        customizeQuestions()
        displayQuestion()
        createQuestionNumberLabel()
        createScoreLabel()
        
    }
    
    private func createQuestions() {
        presenter.loadScreen()
    }
    
    
    private func createQuestionNumberLabel() {
        questionNumberLabel.textAlignment = .center
        questionNumberLabel.font = UIFont.systemFont(ofSize: 20)
        questionNumberLabel.textColor = .white
        questionNumberLabel.backgroundColor = customBackgroundColor
        questionNumberLabel.layer.borderColor = UIColor.white.cgColor
        questionNumberLabel.layer.borderWidth = 2
        questionNumberLabel.layer.cornerRadius = 15
        questionNumberLabel.text = "Question 1"
        questionNumberLabel.adjustsFontSizeToFitWidth = true
        questionNumberLabel.minimumScaleFactor = 0.5
        
        view.addSubview(questionNumberLabel)
        
        questionNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionNumberLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            questionNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            questionNumberLabel.widthAnchor.constraint(equalToConstant: 120),
            questionNumberLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    
    private func createScoreLabel() {
        scoreLabel.textAlignment = .center
        scoreLabel.numberOfLines = 0
        scoreLabel.font = UIFont.systemFont(ofSize: 20)
        scoreLabel.textColor = .white
        
        scoreLabel.backgroundColor = customBackgroundColor
        scoreLabel.layer.borderColor = UIColor.white.cgColor
        scoreLabel.layer.borderWidth = 2
        scoreLabel.layer.cornerRadius = 15
        scoreLabel.text = "Score: 0"
        scoreLabel.adjustsFontSizeToFitWidth = true
        scoreLabel.minimumScaleFactor = 0.5
        
        view.addSubview(scoreLabel)
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            scoreLabel.widthAnchor.constraint(equalToConstant: 120),
            scoreLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    
    
    private func customizeQuestions() {
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: 25)
        questionLabel.numberOfLines = 0
        questionLabel.backgroundColor = customBackgroundColor
        questionLabel.layer.borderColor = UIColor.white.cgColor
        questionLabel.layer.borderWidth = 2
        questionLabel.layer.cornerRadius = 30
        questionLabel.textColor = .white
        questionLabel.lineBreakMode = .byWordWrapping
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
                button.titleLabel?.numberOfLines = 0
                button.titleLabel?.minimumScaleFactor = 0.5 // уменьшаем размер текста не менее чем в два раза
                button.titleLabel?.adjustsFontSizeToFitWidth = true // автоматически уменьшаем размер текста, чтобы он помещался внутри кнопки
                button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold) // устанавливаем начальный размер шрифта
                
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
    
    private func displayQuestion() {
        if currentQuestionIndex > 13 || currentQuestionIndex >= questions.count {
            saveUserBalanceInCoreData(name: name, score: score)
            presenter.showResultController(userscore: score)
        } else {
            let currentQuestion = questions[currentQuestionIndex]
            questionLabel.text = currentQuestion.questionText
            
            for i in 0..<currentQuestion.answers.count {
                answersButtons[i].setTitle(currentQuestion.answers[i], for: .normal)
                answersButtons[i].backgroundColor = buttonBackgroundColor
            }
        }
    }
    
    @objc private func answerSelected(sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        if sender.currentTitle == currentQuestion.answers[currentQuestion.correctAnswerIndex] {
            score *= 2
            sender.backgroundColor = correctAnswerColor
        } else {
            sender.backgroundColor = wrongAnswerColor
            saveUserBalanceInCoreData(name: name, score: score)
            presenter.finishTheGame(userscore: score)
            print("UR score is:" + "\(score)")
            return
        }
        
        // Update question number label and score label
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            let nextQuestionIndex = self.currentQuestionIndex + 1
            let questionNumberText = "Question \(nextQuestionIndex)"
            let scoreText = "Score: \(self.score)"
            
            self.questionNumberLabel.text = questionNumberText
            scoreLabel.text = scoreText
        }
        
        // задержка перед показом следующего вопроса
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.currentQuestionIndex < self.questions.count - 1 {
                self.currentQuestionIndex += 1
                self.displayQuestion()
            } else {
                self.displayQuestion()
                return
            }
        }
    }
    
    private func customizeAllButtons() {
        let allButtons: [UIButton] = [/* add all buttons you have here */]
        for button in allButtons {
            button.backgroundColor = buttonBackgroundColor
            button.layer.cornerRadius = 10
            button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
            button.setTitleColor(.black, for: .normal)
        }
    }
    
    func saveUserBalanceInCoreData(name: String, score: Int) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Ищем пользователя в CoreData
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", name)
        var user: User?
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                user = results.first
            }
        } catch {
            print("Error fetching User from CoreData: \(error.localizedDescription)")
        }
     
        // Обновляем баланс пользователя
        user?.balance += Int64(score)
        
        do {
            try context.save()
            print("User balance saved in CoreData.")
        } catch {
            print("Error saving User balance in CoreData: \(error.localizedDescription)")
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

        questions.append(Question(questionText: "Какую фамилию носил главный герой поэмы А. Твардовского?", answers: ["Тёркин", "Мишустин", "Путин", "Балайкин"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Как часто называют человека, который не реагируют на чужие переживания?", answers: ["Лепеша", "Галета", "Пряник", "Сухарь"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Кого согласно поговорке, берут за рога, смело приступая к делу?", answers: ["Барана", "Быка", "Мужа", "Лося"], correctAnswerIndex: 1))
        questions.append(Question(questionText: "Что англичане традиционно делают в 5 часов вечера?", answers: ["Ложатся спать", "Обедают", "Пьют чай", "Поют гимн"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Как называется столица Франции?", answers: ["Париж", "Квебек", "Астана", "Альмуалим"], correctAnswerIndex: 0))
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
        questions.append(Question(questionText: "Какой игрок является рекордсменом по числу забитых голов на Чемпионате мира по футболу?", answers: ["Лионель Месси", "Криштиану Роналду", "Пеле", "Миро Клозе"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Какой была первая в мире видеоконсоль, вышедшая на рынок?", answers: ["Nintendo Entertainment", "Atari 2600", "Magnavox Odyssey", "Sega Master System"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Какой советский фильм удостоен Гран-при Каннского кинофестиваля?", answers: ["Мастер и Маргарита", "Зеркало", "Летят журавли", "Солярис"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Какой город называют 'Городом ветров'?", answers: ["Чикаго", "Херсонес Таврический", "Варшава", "Сан-Франциско"], correctAnswerIndex: 1))
        questions.append(Question(questionText: "Какая страна считается родиной бандо, каратэ, дзюдо, айкидо, кобудо?", answers: ["Япония", "Китай", "Индия", "Таиланд"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Кто написал произведение 'Война и мир'?", answers: ["Н. В. Гоголь", "А. С. Пушкин", "Л. Н. Толстой", "Михаил Лермонтов"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Какой газ в медицинской практике используется вместо общего наркоза?", answers: ["Кислород", "Углекислый газ", "Азот", "Гелий"], correctAnswerIndex: 2))
        questions.append(Question(questionText: "Какой цветовой гамме соответствует период Эдо в истории Японии?", answers: ["Черный", "Красный", "Фиолетовый", "Коричневый"], correctAnswerIndex: 3))
        questions.append(Question(questionText: "Какой национальности был философ Фридрих Ницше?", answers: ["Немецкой", "Французской", "Итальянской", "Швейцарской"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Какая самая часто используемая клавиша на клавиатуре компьютера?", answers: ["Пробел", "Enter", "Tab", "Shift"], correctAnswerIndex: 0))
        questions.append(Question(questionText: "Какая столица называется 'Городом ангелов'?", answers: ["Сидней", "Лос-Анджелес", "Стамбул", "Рио-де-Жанейро"], correctAnswerIndex: 1))
        questions.append(Question(questionText: "Какая река является самой длинной в мире?", answers: ["Амазонка", "Нил", "Янцзы", "Миссисипи"], correctAnswerIndex: 0))

        questions.shuffle()
    }
    func playMusic() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "game", ofType: "mp3")!))
            audio.prepareToPlay()
        } catch {
            print("Cant load music")
        }
        audio.currentTime = 0
        audio.play()
    }
}

