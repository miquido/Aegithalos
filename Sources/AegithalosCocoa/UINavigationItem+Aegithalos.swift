#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UINavigationItem {
  
  @inlinable func title(_ string: String) -> Setup {
    composed { (subject: Subject) in subject.title = string }
  }
  
  @inlinable func title(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    value: String = "",
    localizationComment comment: String = ""
  ) -> Setup {
    composed { (subject: Subject) in
      subject.title = NSLocalizedString(
        key,
        tableName: tableName,
        bundle: bundle,
        value: value,
        comment: comment
      )
    }
  }
  
  @inlinable func titleView(_ view: UIView) -> Setup {
    composed { [unowned view] (subject: Subject) in subject.titleView = view }
  }

  @inlinable func hidesBackButton(_ hides: Bool) -> Setup {
    composed { (subject: Subject) in subject.hidesBackButton = hides }
  }
  
  @inlinable func backBarButtonItem(_ item: UIBarButtonItem) -> Setup {
    composed { [unowned item] (subject: Subject) in subject.backBarButtonItem = item }
  }
  
  @inlinable func leftBarButtonItem(_ item: UIBarButtonItem) -> Setup {
    composed { [unowned item] (subject: Subject) in subject.leftBarButtonItem = item }
  }
  
  @inlinable func rightBarButtonItem(_ item: UIBarButtonItem) -> Setup {
    composed { [unowned item] (subject: Subject) in subject.rightBarButtonItem = item }
  }
  
  @inlinable func largeTitleDisplayMode(_ mode: UINavigationItem.LargeTitleDisplayMode) -> Setup {
    composed { (subject: Subject) in subject.largeTitleDisplayMode = mode }
  }
  
  @inlinable func hidesSearchBarWhenScrolling(_ hides: Bool) -> Setup {
    composed { (subject: Subject) in subject.hidesSearchBarWhenScrolling = hides }
  }
  
  @inlinable func searchController(_ controller: UISearchController) -> Setup {
    composed { [unowned controller] (subject: Subject) in subject.searchController = controller }
  }
}

// MARK: - Mutation

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
