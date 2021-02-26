import Foundation

/// Wrapper for closure that exposes objc selector for invoking it.
/// Meant to be used for target/action mechanisms from UIKit.
@usableFromInline internal class ClosureHolder {
  
  private let closure: (Any?) -> Void
  private let cleanup: (() -> Void)?
  
  @usableFromInline internal init(
    _ closure: @escaping (Any?) -> Void,
    cleanup: (() -> Void)? = nil
  ) {
    self.closure = closure
    self.cleanup = cleanup
  }
  
  deinit {
    cleanup?()
  }
  
  @usableFromInline @objc internal func invoke(with any: Any) {
    closure(any)
  }
}
