#if canImport(UIKit)

import UIKit

internal extension UIControl {
  
  /// - warning: Closure will never be released until its holder (this UIControl) becomes released.
  /// However you can still remove it from being executed for given event using `removeTarget(_:action:for:)` method.
  @usableFromInline func addAction(
    _ closure: @escaping () -> Void,
    for event: UIControl.Event = .touchUpInside
  ) {
    // We can't use closures for target/action mechanism so we use wrapper that exposes objc selector.
    let closureHolder = ClosureHolder { _ in closure() }
    // We have to keep reference to ClosureHolder since `addTarget(_:action:for:)` uses weak reference.
    addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)), for: event)
    // To avoid subclassing or external storage we keep that as assocaiated object.
    objc_setAssociatedObject(
      self,
      // Allocate single byte and get pointer to it. objc associated object requires pointer to a single byte for association.
      // We do not store or reuse it since we do not allow removal of those objects. It will live as long as this UIControl.
      // And we don't want to replace previously added closures.
      UnsafeRawPointer(UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 0)),
      closureHolder,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )
  }
}

#endif
