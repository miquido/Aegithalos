import UIKit
import AegithalosCocoa

class PlaygroundViewController: UIViewController {
  
  override func loadView() {
    view = Setup.of(UIView.self)
      .backgroundColor(.white)
      .instantiate()
  }
}
