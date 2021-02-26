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
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    value: String = "",
    localizationComment comment: String = "",
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setTitle(
        NSLocalizedString(
          key,
          tableName: tableName,
          bundle: bundle,
          value: value,
          comment: comment
        ),
        for: state
      )
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

// MARK: - Mutation

public extension Mutation where Subject: UIButton {
  
  @inlinable static func titleFont(_ value: UIFont) -> Self {
    .custom { (subject: Subject) in
      subject.titleLabel?.font = value
    }
  }
  
  @inlinable static func attributedTitle(
    _ value: NSAttributedString,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      subject.setAttributedTitle(value, for: state)
    }
  }
  
  @inlinable static func titleInsets(_ value: UIEdgeInsets) -> Self {
    .custom { (subject: Subject) in
      subject.titleEdgeInsets = value
    }
  }
  
  @inlinable static func titleColor(
    _ value: UIColor,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      subject.setTitleColor(value, for: state)
    }
  }
  
  @inlinable static func titleAlignment(_ value: NSTextAlignment) -> Self {
    .custom { (subject: Subject) in
      subject.titleLabel?.textAlignment = value
    }
  }
  
  @inlinable static func titleLineBreakMode(_ value: NSLineBreakMode) -> Self {
    .custom { (subject: Subject) in
      subject.titleLabel?.lineBreakMode = value
    }
  }
  
  @inlinable static func title(
    _ title: String,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      subject.setTitle(title, for: state)
    }
  }
  
  @inlinable static func title(
    localized key: LocalizationKeyConstant,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      let localized = NSLocalizedString(
        key.rawValue,
        tableName: tableName,
        bundle: bundle,
        comment: ""
      )
      if arguments.isEmpty {
        subject.setTitle(localized, for: state)
      } else {
        subject.setTitle(
          String(
            format: localized,
            arguments: arguments
          ),
          for: state
        )
      }
    }
  }
  
  @inlinable static func backgroundImage(
    named imageName: ImageNameConstant,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      subject.setBackgroundImage(
        UIImage(
          named: imageName.rawValue,
          in: bundle,
          compatibleWith: traitCollection
        ),
        for: state
      )
    }
  }
  
  @inlinable static func image(
    named imageName: ImageNameConstant,
    from bundle: Bundle? = nil,
    withInsets insets: UIEdgeInsets = .zero,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      subject.setImage(
        UIImage(
          named: imageName.rawValue,
          in: bundle,
          compatibleWith: traitCollection
        ),
        for: state
      )
      subject.imageEdgeInsets = insets
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func image(
    symbol symbolName: String,
    withInsets insets: UIEdgeInsets = .zero,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      subject.setImage(
        UIImage(
          systemName: symbolName,
          compatibleWith: traitCollection
        ),
        for: state
      )
      subject.imageEdgeInsets = insets
    }
  }
}

#endif
