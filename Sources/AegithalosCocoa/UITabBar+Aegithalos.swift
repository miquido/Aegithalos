#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UITabBar {
  
  @inlinable func tintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.tintColor = color }
  }
  
  @inlinable func barTintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.barTintColor = color }
  }
  
  @inlinable func unselectedItemTintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.unselectedItemTintColor = color }
  }

  @inlinable func backgroundImage(_ image: UIImage?) -> Setup {
    composed { (subject: Subject) in subject.backgroundImage = image }
  }

  @inlinable func shadowImage(_ image: UIImage?) -> Setup {
    composed { (subject: Subject) in subject.shadowImage = image }
  }

  @inlinable func itemWidth(_ width: CGFloat) -> Setup {
    composed { (subject: Subject) in subject.itemWidth = width }
  }

  @inlinable func itemSpacing(_ spacing: CGFloat) -> Setup {
    composed { (subject: Subject) in subject.itemSpacing = spacing }
  }

  @inlinable func barStyle(_ style: UIBarStyle) -> Setup {
    composed { (subject: Subject) in subject.barStyle = style }
  }

  @inlinable func isTranslucent(_ translucent: Bool) -> Setup {
    composed { (subject: Subject) in subject.isTranslucent = translucent }
  }

  @inlinable func item(_ item: UITabBarItem) -> Setup {
    composed { (subject: Subject) in
      var items = subject.items ?? []
      items.append(item)
      subject.items = items
    }
  }

  @inlinable func delegate(_ delegate: UITabBarDelegate) -> Setup {
    composed { [unowned delegate] (subject: Subject) in subject.delegate = delegate }
  }
}

// MARK: - Mutation

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
