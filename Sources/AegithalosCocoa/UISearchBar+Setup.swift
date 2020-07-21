#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UISearchBar {
    
  @inlinable func placeholder(_ text: String) -> Setup {
    composed { (subject: Subject) in
      subject.placeholder = text
    }
  }
  
  @inlinable func placeholder(localized key: String, localizationComment: String = "") -> Setup {
    composed { (subject: Subject) in
      subject.placeholder = NSLocalizedString(key, comment: localizationComment)
    }
  }
  
  @inlinable func image(
    named imageName: String,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil,
    forIcon icon: UISearchBar.Icon,
    inState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setImage(
        UIImage(
          named: imageName,
          in: bundle,
          compatibleWith: traitCollection
        ),
        for: icon,
        state: state
      )
    }
  }
  
  @inlinable func image(
    _ image: UIImage?,
    forIcon icon: UISearchBar.Icon,
    inState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setImage(image, for: icon, state: state)
    }
  }
  
  @inlinable func tintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.tintColor = color }
  }
  
  @inlinable func barTintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.barTintColor = color }
  }
  
  @inlinable func backgroundImage(
    _ image: UIImage?,
    for position: UIBarPosition = .any,
    barMetrics: UIBarMetrics = .default
  ) -> Setup {
    composed { (subject: Subject) in
      subject.setBackgroundImage(image, for: position, barMetrics: barMetrics)
    }
  }
  
  @inlinable func showsCancelButton(_ shows: Bool) -> Setup {
    composed { (subject: Subject) in
      subject.showsCancelButton = shows
    }
  }
  
  @inlinable func delegate(_ delegate: UISearchBarDelegate) -> Setup {
    composed { [unowned delegate] (subject: Subject) in subject.delegate = delegate }
  }

  @available(iOS 13.0, *)
  @inlinable func searchTextFieldSetup(_ setup: Setup<UISearchTextField>) -> Setup {
    setup.contramap(\Subject.searchTextField)
  }
}

#endif
