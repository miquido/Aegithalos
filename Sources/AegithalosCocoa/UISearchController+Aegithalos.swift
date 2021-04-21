#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UISearchController {
  
  @inlinable static func obscuresBackgroundDuringPresentation(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.obscuresBackgroundDuringPresentation = value
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func automaticallyShowsCancelButton(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.automaticallyShowsCancelButton = value
    }
  }
  
  @inlinable static func delegate(_ value: UISearchControllerDelegate) -> Self {
    .custom { [unowned value] (subject: Subject) in
      subject.delegate = value
    }
  }
  
  @inlinable static func searchResultsUpdater(_ value: UISearchResultsUpdating) -> Self {
    .custom { [unowned value] (subject: Subject) in
      subject.searchResultsUpdater = value
    }
  }
}

#endif
