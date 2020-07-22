#if canImport(UIKit)

import UIKit
import Aegithalos

extension UIViewController: SetupInstantiable {

  public class func instantiateForSetup() -> Self {
    Self()
  }
}

public extension Setup where Subject: UIViewController {
  
  @inlinable func title(_ string: String) -> Setup {
    composed { (subject: Subject) in subject.title = string }
  }
  
  @inlinable func title(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    value: String = "",
    localizationComment comment: String = ""
  ) -> Setup {
    composed { (subject: Subject) in
      subject.title = NSLocalizedString(
        key,
        tableName: tableName,
        bundle: bundle,
        value: value,
        comment: comment
      )
    }
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
