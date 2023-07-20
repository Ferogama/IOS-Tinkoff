


import Foundation
import UIKit
import CoreData

class RatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var presenter: RatingViewControllerOutput
    
    init(presenter: RatingViewControllerOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView:UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    let customBackgroundColor = UIColor(red: 72/255, green: 61/255, blue: 139/255, alpha: 1.0)
    let topLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupThemes()
        setupBarItem()
        tableViewReloading()
        reloadNotes()
        presenter.viewDidLoad()
        createTopLabel()
    }
    
    private func setupThemes() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    private func createTopLabel() {
       
        topLabel.center = view.center
        topLabel.text = "Топ 10 игроков:"
        topLabel.textColor = UIColor.white
        topLabel.font = UIFont.systemFont(ofSize: 35)
        topLabel.textAlignment = .center
        
        view.addSubview(topLabel)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupBarItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "←",
            style: .plain,
            target: self,
            action: #selector(didTapBackButton)
        )
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc private func didTapBackButton() {
        presenter.didTapBackButton()
    }
    
    private func tableViewReloading() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            tableView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let data = presenter.data(for: indexPath.row)
        var configuration = UIListContentConfiguration.subtitleCell()
        configuration.text = data.0
        configuration.secondaryText = "\(data.1)"
        cell.contentConfiguration = configuration
        return cell
    }
}

extension RatingViewController: RatingViewControllerInput {
    func reloadNotes() {
        tableView.reloadData()
    }
}
