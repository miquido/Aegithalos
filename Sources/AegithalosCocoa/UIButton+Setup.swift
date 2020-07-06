#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIButton {
  
  @inlinable func titleFont(_ font: UIFont) -> Setup {
    composed { button in button.titleLabel?.font = font }
  }
  
  @inlinable func title(
    _ title: String,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { button in button.setTitle(title, for: state) }
  }
  
  @inlinable func title(
    localized key: String,
    localizationComment: String = "",
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { button in
      button.setTitle(NSLocalizedString(key, comment: localizationComment), for: state)
    }
  }
  
  @inlinable func attributedTitle(
    _ attributedTitle: NSAttributedString,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { button in button.setAttributedTitle(attributedTitle, for: state) }
  }
  
  @inlinable func titleInsets(_ insets: UIEdgeInsets) -> Setup {
    composed { button in button.titleEdgeInsets = insets }
  }
  
  @inlinable func titleColor(
    _ color: UIColor,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { button in button.setTitleColor(color, for: state) }
  }
  
  @inlinable func titleAlignment(_ alignment: NSTextAlignment) -> Setup {
    composed { button in button.titleLabel?.textAlignment = alignment }
  }
  
  @inlinable func backgroundImage(
    _ image: UIImage?,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { button in button.setBackgroundImage(image, for: state) }
  }
  
  @inlinable func titleLineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Setup {
    composed { button in button.titleLabel?.lineBreakMode = lineBreakMode }
  }
  
  @inlinable func image(
    _ image: UIImage,
    withInsets insets: UIEdgeInsets = .zero,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { button in
      button.setImage(image, for: state)
      button.imageEdgeInsets = insets
    }
  }
  
  @inlinable func image(
    named imageName: String,
    from bundle: Bundle? = nil,
    withInsets insets: UIEdgeInsets = .zero,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { button in
      button.setImage(UIImage(named: imageName, in: bundle, compatibleWith: traitCollection), for: state)
      button.imageEdgeInsets = insets
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable func image(
    symbol symbolName: String,
    withInsets insets: UIEdgeInsets = .zero,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { button in
      button.setImage(UIImage(systemName: symbolName, compatibleWith: traitCollection), for: state)
      button.imageEdgeInsets = insets
    }
  }
}

#endif
