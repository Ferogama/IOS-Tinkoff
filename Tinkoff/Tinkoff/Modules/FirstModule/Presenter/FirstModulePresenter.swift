//
//  FirstModulePresenter.swift
//  Tinkoff
//
//  Created by a.akhmadiev on 31.03.2023.
//

import UIKit

final class FirstModulePresenter {

    weak var view: FirstViewControllerInput?
    weak var moduleOutput: FirstModuleOutput?

    init(
        view: FirstViewControllerInput? = nil,
        moduleOutput: FirstModuleOutput
    ) {
        self.view = view
        self.moduleOutput = moduleOutput
    }
}

extension FirstModulePresenter: FirstViewControllerOutput {
    func didTapPlay() {
        moduleOutput?.moveToSecondScreen()
    }

    func viewDidLoad() {
        view?.showImage(image: UIImage(named: "logo"))
    }
}
