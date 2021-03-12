#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UISearchController {
  
  @inlinable func obscuresBackgroundDuringPresentation(_ obscures: Bool) -> Setup {
    composed { (subject: Subject) in subject.obscuresBackgroundDuringPresentation = obscures }
  }
  
  @available(iOS 13.0, *)
  @inlinable func automaticallyShowsCancelButton(_ shows: Bool) -> Setup {
    composed { (subject: Subject) in subject.automaticallyShowsCancelButton = shows }
  }
  
  @inlinable func delegate(_ delegate: UISearchControllerDelegate) -> Setup {
    composed { [unowned delegate] (subject: Subject) in subject.delegate = delegate }
  }
  
  @inlinable func searchResultsUpdater(_ updater: UISearchResultsUpdating) -> Setup {
    composed { [unowned updater] (subject: Subject) in subject.searchResultsUpdater = updater }
  }
  
  @inlinable func searchBarSetup(_ setup: Setup<UISearchBar>) -> Setup {
    setup.contramap(\Subject.searchBar)
  }
}
// MARK: - Mutation

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
