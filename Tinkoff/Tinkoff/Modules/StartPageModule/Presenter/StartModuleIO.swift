
import Foundation

protocol StartModuleOutput: AnyObject {
    func moveToSecondScreen()
    func play()
   
}

protocol StartModuleInput: AnyObject {
    func registeredUser(name:String, balance: Int)
 
}
