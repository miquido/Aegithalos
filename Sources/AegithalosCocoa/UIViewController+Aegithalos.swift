#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UIViewController {
  
  @inlinable static func title(_ value: String) -> Self {
    Self { (subject: Subject) in
      subject.title = value
    }
  }
  
  @inlinable static func title(
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
        subject.title = localized
      } else {
        subject.title = String(
          format: localized,
          arguments: arguments
        )
      }
    }
  }
  
  @inlinable static func definesPresentationContext(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.definesPresentationContext = value
    }
  }
  
  @inlinable static func modalPresentationStyle(_ value: UIModalPresentationStyle) -> Self {
    Self { (subject: Subject) in
      subject.modalPresentationStyle = value
    }
  }
}

extension UIViewController: EmptyInstantiable {}

#endif
