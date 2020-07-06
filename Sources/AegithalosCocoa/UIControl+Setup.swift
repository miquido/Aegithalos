#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIControl {
  
  @inlinable func contentHorizontalAlignment(_ alignment: UIControl.ContentHorizontalAlignment) -> Setup {
    composed { control in control.contentHorizontalAlignment = alignment }
  }
  
  @inlinable func contentVerticalAlignment(_ alignment: UIControl.ContentVerticalAlignment) -> Setup {
    composed { control in control.contentVerticalAlignment = alignment }
  }
  
  @inlinable func target(_ target: Any & NSObjectProtocol, action: Selector, for event: UIControl.Event = .touchUpInside) -> Setup {
    composed { [unowned target] control in control.addTarget(target, action: action, for: event) }
  }
}

#endif
