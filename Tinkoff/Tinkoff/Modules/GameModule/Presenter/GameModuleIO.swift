

import Foundation

protocol GameModuleOutput: AnyObject {
    func finishGame(score: Int)
    func openResultController(score: Int)
}

