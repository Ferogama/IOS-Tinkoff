import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    var flowCoordinator: FlowCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

//        let navigationController = UINavigationController()
//        flowCoordinator = FlowCoordinator(navigationController: navigationController)
//        flowCoordinator.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        //window?.rootViewController = navigationController
        window?.rootViewController = FirstViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
