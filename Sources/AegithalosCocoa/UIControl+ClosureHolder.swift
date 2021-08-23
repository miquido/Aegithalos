#if canImport(UIKit)
  import UIKit

  extension UIControl {

    /// - warning: Closure will never be released until its holder (this UIControl) becomes released.
    /// However you can still remove it from being executed for given event using `removeActions` or `removeTarget(_:action:for:)` method.
    @usableFromInline func addAction(
      _ closure: @escaping () -> Void,
      for event: UIControl.Event = .touchUpInside
    ) {
      // Allocate a single byte for objc associated object key.
      // We do not store or reuse it since we do not allow removal of those objects. It will live as long as this UIControl.
      // We don't want to replace previously added closures. However we deallocate that byte on deinit of ClosureHolder
      let keyPointer = UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 0)
      // We can't use closures for target/action mechanism so we use wrapper that exposes objc selector.
      let closureHolder = ClosureHolder({ _ in closure() }, cleanup: { keyPointer.deallocate() })
      // We have to keep reference to ClosureHolder since `addTarget(_:action:for:)` uses weak reference.
      addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)), for: event)
      // To avoid subclassing or external storage we keep that as assocaiated object.
      objc_setAssociatedObject(
        self,
        UnsafeRawPointer(keyPointer),
        closureHolder,
        .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
    }

    @usableFromInline func removeActions(
      for event: UIControl.Event
    ) {
      removeTarget(nil, action: nil, for: event)
    }
  }

#endif
