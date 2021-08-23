#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UIBarButtonItem {

    @inlinable public static func style(_ value: UIBarButtonItem.Style) -> Self {
      Self { (subject: Subject) in
        subject.style = value
      }
    }

    @inlinable public static func customView(_ value: UIView?) -> Self {
      .custom { [unowned value] (subject: Subject) in
        subject.customView = value
      }
    }

    @inlinable public static func tintColor(_ value: UIColor) -> Self {
      Self { (subject: Subject) in
        subject.tintColor = value
      }
    }

    @inlinable public static func action(
      _ value: @escaping () -> Void
    ) -> Self {
      Self { (subject: Subject) in
        // We can't use closures for target/action mechanism so we use wrapper that exposes objc selector.
        let closureHolder = ClosureHolder({ _ in value() }, cleanup: {})
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

  // Allocate a single byte for objc associated object key.
  @usableFromInline internal let barButtonItemActionAssociationKeyPointer = UnsafeRawPointer(
    UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 0))

  extension UIBarButtonItem: EmptyInstantiable {}

#endif
