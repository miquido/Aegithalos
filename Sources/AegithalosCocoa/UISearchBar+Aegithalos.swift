#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UISearchBar {
  
  @inlinable static func placeholder(
    localized key: LocalizationKeyConstant,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...
  ) -> Self {
    Self { (subject: Subject) in
      let localized = NSLocalizedString(
        key.rawValue,
        tableName: tableName,
        bundle: bundle,
        comment: ""
      )
      if arguments.isEmpty {
        subject.placeholder = localized
      } else {
        subject.placeholder = String(
          format: localized,
          arguments: arguments
        )
      }
    }
  }
  
  @inlinable static func image(
    named imageName: ImageNameConstant,
    from bundle: Bundle? = nil,
    withInsets insets: UIEdgeInsets = .zero,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forIcon icon: UISearchBar.Icon,
    inState state: UIControl.State = .normal
  ) -> Self {
    Self { (subject: Subject) in
      subject.setImage(
        UIImage(
          named: imageName.rawValue,
          in: bundle,
          compatibleWith: traitCollection
        ),
        for: icon,
        state: state
      )
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func image(
    symbol: SymbolNameConstant,
    withInsets insets: UIEdgeInsets = .zero,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forIcon icon: UISearchBar.Icon,
    inState state: UIControl.State = .normal
  ) -> Self {
    Self { (subject: Subject) in
      subject.setImage(
        UIImage(
          systemName: symbol.rawValue,
          compatibleWith: traitCollection
        ),
        for: icon,
        state: state
      )
    }
  }
  
  @inlinable static func backgroundImage(
    named imageName: ImageNameConstant,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil,
    for position: UIBarPosition = .any,
    barMetrics: UIBarMetrics = .default
  ) -> Self {
    Self { (subject: Subject) in
      subject.setBackgroundImage(
        UIImage(
          named: imageName.rawValue,
          in: bundle,
          compatibleWith: traitCollection
        ),
        for: position,
        barMetrics: barMetrics
      )
    }
  }
  
  @inlinable static func searchFieldBackgroundImage(
    named imageName: ImageNameConstant,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forState state: UIControl.State = .normal
  ) -> Self {
    Self { (subject: Subject) in
      subject.setSearchFieldBackgroundImage(
        UIImage(
          named: imageName.rawValue,
          in: bundle,
          compatibleWith: traitCollection
        ),
        for: state
      )
    }
  }
  
  @inlinable static func iconPositionAdjustment(
    _ offset: UIOffset,
    for icon: UISearchBar.Icon
  ) -> Self {
    Self { (subject: Subject) in
      subject.setPositionAdjustment(offset, for: icon)
    }
  }
}
#endif
