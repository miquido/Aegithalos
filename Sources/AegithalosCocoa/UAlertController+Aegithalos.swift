#if canImport(UIKit)
import UIKit
import Aegithalos

public extension Mutation where Subject: UIAlertController {
  
  @inlinable static func title(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...
  ) -> Self {
    .custom { (subject: Subject) in
      let localized = NSLocalizedString(
        key,
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
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...
  ) -> Self {
    .custom { (subject: Subject) in
      let localized = NSLocalizedString(
        key,
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
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...,
    style: UIAlertAction.Style = .default,
    handler: @escaping () -> Void
  ) -> Self {
    .custom { (subject: Subject) in
      let localized = NSLocalizedString(
        key,
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
