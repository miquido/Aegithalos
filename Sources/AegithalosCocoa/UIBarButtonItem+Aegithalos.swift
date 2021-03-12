#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIBarButtonItem {
  
  @inlinable func style(_ style: UIBarButtonItem.Style) -> Setup {
    composed { (subject: Subject) in subject.style = style }
  }
  
  @inlinable func customView(_ view: UIView?) -> Setup {
    composed { [unowned view] (subject: Subject) in subject.customView = view }
  }
  
  @inlinable func tintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.tintColor = color }
  }
  
  @inlinable func target(_ target: Any & NSObjectProtocol, action: Selector) -> Setup {
    composed { [unowned target] (subject: Subject) in
      subject.target = target
      subject.action = action
    }
  }
  
  @inlinable func action(_ closure: @escaping () -> Void) -> Setup {
    composed { (subject: Subject) in
      // We can't use closures for target/action mechanism so we use wrapper that exposes objc selector.
      let closureHolder = ClosureHolder({ _ in closure() }, cleanup: {})
      // We have to keep reference to ClosureHolder since `target` uses weak reference.
      subject.target = closureHolder
      subject.action = #selector(ClosureHolder.invoke(with:))
      // To avoid subclassing or external storage we keep that as assocaiated object.
      objc_setAssociatedObject(
        subject,
        barButtonItemActionAssociationKeyPointer,
        closureHolder,
        .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
    }
  }
}

// MARK: - Mutation

public extension Mutation where Subject: UIBarButtonItem {
  
  @inlinable static func style(_ value: UIBarButtonItem.Style) -> Self {
    Self { (subject: Subject) in
      subject.style = value
    }
  }
  
  @inlinable static func customView(_ value: UIView?) -> Self {
    .custom { [unowned value] (subject: Subject) in
      subject.customView = value
    }
  }
  
  @inlinable static func tintColor(_ value: UIColor) -> Self {
    Self { (subject: Subject) in
      subject.tintColor = value
    }
  }
  
  @inlinable static func action(
    _ value: Optional<() -> Void>
  ) -> Self {
    Self { (subject: Subject) in
      if let closure = value {
        // We can't use closures for target/action mechanism so we use wrapper that exposes objc selector.
        let closureHolder = ClosureHolder({ _ in closure() }, cleanup: {})
        // We have to keep reference to ClosureHolder since `target` uses weak reference.
        subject.target = closureHolder
        subject.action = #selector(ClosureHolder.invoke(with:))
        // To avoid subclassing or external storage we keep that as assocaiated object.
        objc_setAssociatedObject(
          subject,
          barButtonItemActionAssociationKeyPointer,
          closureHolder,
          .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
      } else {
        subject.target = nil
        subject.action = nil
        objc_setAssociatedObject(
          subject,
          barButtonItemActionAssociationKeyPointer,
          nil,
          .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
      }
    }
  }
}

// Allocate a single byte for objc associated object key.
@usableFromInline internal let barButtonItemActionAssociationKeyPointer = UnsafeRawPointer(UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 0))

#endif
