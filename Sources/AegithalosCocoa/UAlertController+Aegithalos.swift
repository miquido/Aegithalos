#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UIAlertController {
  
  @inlinable static func title(
    _ value: String
  ) -> Self {
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
  
  @inlinable static func message(
    _ value: String
  ) -> Self {
    Self { (subject: Subject) in
      subject.message = value
    }
  }
  
  @inlinable static func message(
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
        subject.message = localized
      } else {
        subject.message = String(
          format: localized,
          arguments: arguments
        )
      }
    }
  }
  
  @inlinable static func action(
    _ title: String,
    style: UIAlertAction.Style = .default,
    handler: @escaping () -> Void
  ) -> Self {
    Self { (subject: Subject) in
      subject.addAction(
        UIAlertAction(
          title: title,
          style: style,
          handler: { _ in handler() }
        )
      )
    }
  }
  
  @inlinable static func action(
    localized key: LocalizationKeyConstant,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...,
    style: UIAlertAction.Style = .default,
    handler: @escaping () -> Void
  ) -> Self {
    Self { (subject: Subject) in
      let localized = NSLocalizedString(
        key.rawValue,
        tableName: tableName,
        bundle: bundle,
        comment: ""
      )
      
      let title: String
      if arguments.isEmpty {
        title = localized
      } else {
        title = String(
          format: localized,
          arguments: arguments
        )
      }
      
      subject.addAction(
        UIAlertAction(
          title: title,
          style: style,
          handler: { _ in handler() }
        )
      )
    }
  }
}
#endif
