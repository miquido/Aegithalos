import UIKit
import AegithalosCocoa

class PlaygroundViewController: UIViewController {
  
  override func loadView() {
    view = Mutation<UIView>
      .combined(
        .backgroundColor(.white)
      )
      .instantiate()
  }
}
