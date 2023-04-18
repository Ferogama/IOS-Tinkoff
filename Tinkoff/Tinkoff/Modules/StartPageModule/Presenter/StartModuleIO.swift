
import Foundation

protocol StartModuleOutput: AnyObject {
    func moveToSecondScreen()
    
}
protocol StartModuleInput: AnyObject {
    func registeredUser(name:String, balance: Int)
}
