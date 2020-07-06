#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIButton {
  
  @inlinable func titleFont(_ font: UIFont) -> Setup {
    composed { button in button.titleLabel?.font = font }
  }
  
  @inlinable func title(_ title: String, for state: UIControl.State = .normal) -> Setup {
    composed { button in button.setTitle(title, for: state) }
  }
  
  @inlinable func title(localized key: String, localizationComment: String = "", for state: UIControl.State = .normal) -> Setup {
    composed { button in button.setTitle(NSLocalizedString(key, comment: localizationComment), for: state) }
  }
  
  @inlinable func attributedTitle(_ attributedTitle: NSAttributedString, for state: UIControl.State = .normal) -> Setup {
    composed { button in button.setAttributedTitle(attributedTitle, for: state) }
  }
  
  @inlinable func titleColor(_ color: UIColor, state: UIControl.State = .normal) -> Setup {
    composed { button in button.setTitleColor(color, for: state) }
  }
  
  @inlinable func titleAlignment(_ alignment: NSTextAlignment) -> Setup {
    composed { button in button.titleLabel?.textAlignment = alignment }
  }
  
  @inlinable func backgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Setup {
    composed { button in button.setBackgroundImage(image, for: state) }
  }
  
  @inlinable func titleLineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Setup {
    composed { button in button.titleLabel?.lineBreakMode = lineBreakMode }
  }
}

#endif
