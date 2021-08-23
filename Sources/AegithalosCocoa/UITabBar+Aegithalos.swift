#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UITabBar {

    @inlinable public static func tintColor(_ value: UIColor) -> Self {
      Self { (subject: Subject) in
        subject.tintColor = value
      }
    }

    @inlinable public static func barTintColor(_ value: UIColor) -> Self {
      Self { (subject: Subject) in
        subject.barTintColor = value
      }
    }

    @inlinable public static func unselectedItemTintColor(_ value: UIColor) -> Self {
      Self { (subject: Subject) in
        subject.unselectedItemTintColor = value
      }
    }

    @inlinable public static func backgroundImage(_ value: UIImage?) -> Self {
      Self { (subject: Subject) in
        subject.backgroundImage = value
      }
    }

    @inlinable public static func shadowImage(_ value: UIImage?) -> Self {
      Self { (subject: Subject) in
        subject.shadowImage = value
      }
    }

    @inlinable public static func itemWidth(_ value: CGFloat) -> Self {
      Self { (subject: Subject) in
        subject.itemWidth = value
      }
    }

    @inlinable public static func itemSpacing(_ value: CGFloat) -> Self {
      Self { (subject: Subject) in
        subject.itemSpacing = value
      }
    }

    @inlinable public static func barStyle(_ value: UIBarStyle) -> Self {
      Self { (subject: Subject) in
        subject.barStyle = value
      }
    }

    @inlinable public static func translucent(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.isTranslucent = value
      }
    }

    @inlinable public static func item(
      _ items: UITabBarItem...
    ) -> Self {
      Self { (subject: Subject) in
        var updatedItems = subject.items ?? []
        updatedItems.append(contentsOf: items)
        subject.items = updatedItems
      }
    }

    @inlinable public static func delegate(_ value: UITabBarDelegate) -> Self {
      .custom { [unowned value] (subject: Subject) in
        subject.delegate = value
      }
    }
  }
#endif
