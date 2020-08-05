import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  private lazy var mainWindow: UIWindow = {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = PlaygroundViewController()
    return window
  }()

  func application(
    _: UIApplication,
    didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    mainWindow.makeKeyAndVisible()
    return true
  }
}
