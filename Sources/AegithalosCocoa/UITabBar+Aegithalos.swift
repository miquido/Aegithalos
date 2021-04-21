#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UITabBar {
  
  @inlinable static func tintColor(_ value: UIColor) -> Self {
    Self { (subject: Subject) in
      subject.tintColor = value
    }
  }
  
  @inlinable static func barTintColor(_ value: UIColor) -> Self {
    Self { (subject: Subject) in
      subject.barTintColor = value
    }
  }
  
  @inlinable static func unselectedItemTintColor(_ value: UIColor) -> Self {
    Self { (subject: Subject) in
      subject.unselectedItemTintColor = value
    }
  }
  
  @inlinable static func backgroundImage(_ value: UIImage?) -> Self {
    Self { (subject: Subject) in
      subject.backgroundImage = value
    }
  }
  
  @inlinable static func shadowImage(_ value: UIImage?) -> Self {
    Self { (subject: Subject) in
      subject.shadowImage = value
    }
  }
  
  @inlinable static func itemWidth(_ value: CGFloat) -> Self {
    Self { (subject: Subject) in
      subject.itemWidth = value
    }
  }
  
  @inlinable static func itemSpacing(_ value: CGFloat) -> Self {
    Self { (subject: Subject) in
      subject.itemSpacing = value
    }
  }
  
  @inlinable static func barStyle(_ value: UIBarStyle) -> Self {
    Self { (subject: Subject) in
      subject.barStyle = value
    }
  }
  
  @inlinable static func translucent(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isTranslucent = value
    }
  }
  
  @inlinable static func item(
    _ items: UITabBarItem...
  ) -> Self {
    Self { (subject: Subject) in
      var updatedItems = subject.items ?? []
      updatedItems.append(contentsOf: items)
      subject.items = updatedItems
    }
  }
  
  @inlinable static func delegate(_ value: UITabBarDelegate) -> Self {
    .custom { [unowned value] (subject: Subject) in
      subject.delegate = value
    }
  }
}
#endif
