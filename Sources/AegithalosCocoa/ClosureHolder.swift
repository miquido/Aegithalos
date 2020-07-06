import Foundation

internal class ClosureHolder {
    private let closure: (Any?) -> Void

    internal init(_ closure: @escaping (Any?) -> Void) {
        self.closure = closure
    }

    @objc internal func invoke(with any: Any) {
        closure(any)
    }
}
