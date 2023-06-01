
import Foundation

final class ResultModulePresenter {

    weak var moduleOutput: ResultModuleOutput?

    init(
       
        moduleOutput: ResultModuleOutput
       
    ) {
    
        self.moduleOutput = moduleOutput
    
    }
}
extension ResultModulePresenter: ResultViewControllerOutput {
    func startAgain() {
        moduleOutput?.moveToStartScreen()
    }
}

