#if canImport(UIKit)

import UIKit
import Aegithalos

extension UIViewController: SetupInstantiable {

  public class func instantiateForSetup() -> Self {
    Self()
  }
}

public extension Setup where Subject: UIViewController {
  
  @inlinable func title(_ text: String) -> Setup {
    composed { (subject: Subject) in subject.title = text }
  }
  
  @inlinable func title(localized key: String, localizationComment: String = "") -> Setup {
    composed { (subject: Subject) in subject.title = NSLocalizedString(key, comment: localizationComment) }
  }
  
  @inlinable func definesPresentationContext(_ defines: Bool) -> Setup {
    composed { (subject: Subject) in subject.definesPresentationContext = defines }
  }
  
  @inlinable func modalPresentationStyle(_ style: UIModalPresentationStyle) -> Setup {
    composed { (subject: Subject) in subject.modalPresentationStyle = style }
  }
  
  @inlinable func navigationItemSetup(_ setup: Setup<UINavigationItem>) -> Setup {
    setup.contramap(\Subject.navigationItem)
  }
}

#endif
