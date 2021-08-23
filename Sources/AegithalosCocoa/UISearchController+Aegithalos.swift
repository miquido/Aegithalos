#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UISearchController {

    @inlinable public static func obscuresBackgroundDuringPresentation(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.obscuresBackgroundDuringPresentation = value
      }
    }

    @available(iOS 13.0, *)
    @inlinable public static func automaticallyShowsCancelButton(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.automaticallyShowsCancelButton = value
      }
    }

    @inlinable public static func delegate(_ value: UISearchControllerDelegate) -> Self {
      .custom { [unowned value] (subject: Subject) in
        subject.delegate = value
      }
    }

    @inlinable public static func searchResultsUpdater(_ value: UISearchResultsUpdating) -> Self {
      .custom { [unowned value] (subject: Subject) in
        subject.searchResultsUpdater = value
      }
    }
  }

#endif
