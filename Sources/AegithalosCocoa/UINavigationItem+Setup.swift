#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UINavigationItem {
  
  @inlinable func title(_ text: String) -> Setup {
    composed { (subject: Subject) in subject.title = text }
  }
  
  @inlinable func title(localized key: String, localizationComment: String = "") -> Setup {
    composed { (subject: Subject) in subject.title = NSLocalizedString(key, comment: localizationComment) }
  }
  
  @inlinable func titleView(_ view: UIView) -> Setup {
    composed { (subject: Subject) in subject.titleView = view }
  }

  @inlinable func hidesBackButton(_ hides: Bool) -> Setup {
    composed { (subject: Subject) in subject.hidesBackButton = hides }
  }
  
  @inlinable func backBarButtonItem(_ item: UIBarButtonItem) -> Setup {
    composed { (subject: Subject) in subject.backBarButtonItem = item }
  }
  
  @inlinable func leftBarButtonItem(_ item: UIBarButtonItem) -> Setup {
    composed { (subject: Subject) in subject.leftBarButtonItem = item }
  }
  
  @inlinable func rightBarButtonItem(_ item: UIBarButtonItem) -> Setup {
    composed { (subject: Subject) in subject.rightBarButtonItem = item }
  }

  @inlinable func hidesSearchBarWhenScrolling(_ hides: Bool) -> Setup {
    composed { (subject: Subject) in subject.hidesSearchBarWhenScrolling = hides }
  }
  
  @inlinable func largeTitleDisplayMode(_ mode: UINavigationItem.LargeTitleDisplayMode) -> Setup {
    composed { (subject: Subject) in subject.largeTitleDisplayMode = mode }
  }
}

#endif
