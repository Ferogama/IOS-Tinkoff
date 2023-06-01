
import Foundation

protocol StartModuleOutput: AnyObject {
    func moveToSecondScreen()
    func moveToGameScreen(name: String, balance: Int)
    func moveToRatingScreen()
}

protocol StartModuleInput: AnyObject {
    func registeredUser(name:String, balance: Int)
    
}
