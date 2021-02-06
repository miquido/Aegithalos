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

#endif
