#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UINavigationItem {
  
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
  
  @inlinable static func titleView(_ value: UIView) -> Self {
    Self { (subject: Subject) in
      subject.titleView = value
    }
  }
  
  @inlinable static func hidesBackButton(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.hidesBackButton = value
    }
  }
  
  @inlinable static func backBarButtonItem(_ value: UIBarButtonItem) -> Self {
    Self { (subject: Subject) in
      subject.backBarButtonItem = value
    }
  }
  
  @inlinable static func leftBarButtonItem(_ value: UIBarButtonItem) -> Self {
    Self { (subject: Subject) in
      subject.leftBarButtonItem = value
    }
  }
  
  @inlinable static func rightBarButtonItem(_ value: UIBarButtonItem) -> Self {
    Self { (subject: Subject) in
      subject.rightBarButtonItem = value
    }
  }
  
  @inlinable static func largeTitleDisplayMode(_ value: UINavigationItem.LargeTitleDisplayMode) -> Self {
    Self { (subject: Subject) in
      subject.largeTitleDisplayMode = value
    }
  }
  
  @inlinable static func hidesSearchBarWhenScrolling(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.hidesSearchBarWhenScrolling = value
    }
  }
  
  @inlinable static func searchController(_ value: UISearchController) -> Self {
    Self { (subject: Subject) in
      subject.searchController = value
    }
  }
}
#endif
