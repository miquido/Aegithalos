#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UINavigationItem {

    @inlinable public static func title(
      _ value: String
    ) -> Self {
      Self { (subject: Subject) in
        subject.title = value
      }
    }

    @inlinable public static func title(
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

    @inlinable public static func titleView(_ value: UIView) -> Self {
      Self { (subject: Subject) in
        subject.titleView = value
      }
    }

    @inlinable public static func hidesBackButton(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.hidesBackButton = value
      }
    }

    @inlinable public static func backBarButtonItem(_ value: UIBarButtonItem) -> Self {
      Self { (subject: Subject) in
        subject.backBarButtonItem = value
      }
    }

    @inlinable public static func leftBarButtonItem(_ value: UIBarButtonItem) -> Self {
      Self { (subject: Subject) in
        subject.leftBarButtonItem = value
      }
    }

    @inlinable public static func rightBarButtonItem(_ value: UIBarButtonItem) -> Self {
      Self { (subject: Subject) in
        subject.rightBarButtonItem = value
      }
    }

    @inlinable public static func largeTitleDisplayMode(
      _ value: UINavigationItem.LargeTitleDisplayMode
    ) -> Self {
      Self { (subject: Subject) in
        subject.largeTitleDisplayMode = value
      }
    }

    @inlinable public static func hidesSearchBarWhenScrolling(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.hidesSearchBarWhenScrolling = value
      }
    }

    @inlinable public static func searchController(_ value: UISearchController) -> Self {
      Self { (subject: Subject) in
        subject.searchController = value
      }
    }
  }
#endif
