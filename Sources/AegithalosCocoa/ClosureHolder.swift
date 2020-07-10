import Foundation

/// Wrapper for closure that exposes objc selector for invoking it.
/// Meant to be used for target/action mechanisms from UIKit.
internal class ClosureHolder {
    private let closure: (Any?) -> Void

    internal init(_ closure: @escaping (Any?) -> Void) {
        self.closure = closure
    }

    @objc internal func invoke(with any: Any) {
        closure(any)
    }
}
