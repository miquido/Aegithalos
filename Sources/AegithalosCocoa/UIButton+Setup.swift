#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIButton {
  
  @inlinable func titleFont(_ font: UIFont) -> Setup {
    composed { (subject: Subject) in subject.titleLabel?.font = font }
  }
  
  @inlinable func title(
    _ title: String,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in subject.setTitle(title, for: state) }
  }
  
  @inlinable func title(
    localized key: String,
    localizationComment: String = "",
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setTitle(NSLocalizedString(key, comment: localizationComment), for: state)
    }
  }
  
  @inlinable func attributedTitle(
    _ attributedTitle: NSAttributedString,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in subject.setAttributedTitle(attributedTitle, for: state) }
  }
  
  @inlinable func titleInsets(_ insets: UIEdgeInsets) -> Setup {
    composed { (subject: Subject) in subject.titleEdgeInsets = insets }
  }
  
  @inlinable func titleColor(
    _ color: UIColor,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in subject.setTitleColor(color, for: state) }
  }
  
  @inlinable func titleAlignment(_ alignment: NSTextAlignment) -> Setup {
    composed { (subject: Subject) in subject.titleLabel?.textAlignment = alignment }
  }
  
  @inlinable func backgroundImage(
    _ image: UIImage?,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in subject.setBackgroundImage(image, for: state) }
  }
  
  @inlinable func titleLineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Setup {
    composed { (subject: Subject) in subject.titleLabel?.lineBreakMode = lineBreakMode }
  }
  
  @inlinable func image(
    _ image: UIImage?,
    withInsets insets: UIEdgeInsets = .zero,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setImage(image, for: state)
      subject.imageEdgeInsets = insets
    }
  }
  
  @inlinable func image(
    named imageName: String,
    from bundle: Bundle? = nil,
    withInsets insets: UIEdgeInsets = .zero,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setImage(UIImage(named: imageName, in: bundle, compatibleWith: traitCollection), for: state)
      subject.imageEdgeInsets = insets
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable func image(
    symbol symbolName: String,
    withInsets insets: UIEdgeInsets = .zero,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setImage(UIImage(systemName: symbolName, compatibleWith: traitCollection), for: state)
      subject.imageEdgeInsets = insets
    }
  }
}

#endif
