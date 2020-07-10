import Foundation

/// Wrapper for closure that exposes objc selector for invoking it.
/// Meant to be used for target/action mechanisms from UIKit.
internal class ClosureHolder {
  private let closure: (Any?) -> Void
  private let cleanup: () -> Void
  
  internal init(_ closure: @escaping (Any?) -> Void, cleanup: @escaping () -> Void) {
    self.closure = closure
    self.cleanup = cleanup
  }
  
  deinit {
    cleanup()
  }
  
  @objc internal func invoke(with any: Any) {
    closure(any)
  }
}
