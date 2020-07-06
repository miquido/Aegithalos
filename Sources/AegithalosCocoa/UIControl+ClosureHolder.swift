#if canImport(UIKit)

import UIKit

private var closurePropertyKeys: Dictionary<UIControl.Event.RawValue, UnsafeRawPointer> = [:]

internal extension UIControl {
  
  @usableFromInline func setClosure(_ closure: @escaping () -> Void, for event: UIControl.Event) {
    let closureHolder = ClosureHolder { _ in closure() }
    if closurePropertyKeys[event.rawValue] == nil {
      closurePropertyKeys[event.rawValue] = UnsafeRawPointer(UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 0))
    } else { /**/ }
    if let previousClosure = objc_getAssociatedObject(self, closurePropertyKeys[event.rawValue]!) {
      removeTarget(previousClosure, action: nil, for: event)
    } else { /**/ }
    addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)), for: event)
    objc_setAssociatedObject(self, closurePropertyKeys[event.rawValue]!, closureHolder, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
}

#endif
