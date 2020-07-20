#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UINavigationBar {
  
  @inlinable func barStyle(_ style: UIBarStyle) -> Setup {
    composed { (subject: Subject) in subject.barStyle = style }
  }
  
  @inlinable func barTintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.barTintColor = color }
  }
  
  @inlinable func backgroundImage(
    _ image: UIImage?,
    for position: UIBarPosition = .any,
    barMetrics: UIBarMetrics = .default
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setBackgroundImage(image, for: position, barMetrics: barMetrics)
    }
  }
  
  @inlinable func shadowImage(_ image: UIImage?) -> Setup {
    composed { (subject: Subject) in subject.shadowImage = image }
  }
  
  @inlinable func tintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.tintColor = color }
  }
  
  @inlinable func isTranslucent(_ translucent: Bool) -> Setup {
    composed { (subject: Subject) in subject.isTranslucent = translucent }
  }
  
  @inlinable func prefersLargeTitles(_ preferes: Bool) -> Setup {
    composed { (subject: Subject) in subject.prefersLargeTitles = preferes }
  }
  
  @inlinable func titleTextAttributes(_ attributes: Dictionary<NSAttributedString.Key, Any>) -> Setup {
    composed { (subject: Subject) in subject.titleTextAttributes = attributes }
  }
  
  @inlinable func delegate(_ delegate: UINavigationBarDelegate) -> Setup {
    composed { [unowned delegate] (subject: Subject) in subject.delegate = delegate }
  }
}

#endif
