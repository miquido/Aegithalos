#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UISearchBar {
    
  @inlinable func placeholder(_ string: String) -> Setup {
    composed { (subject: Subject) in subject.placeholder = string }
  }
  
  @inlinable func placeholder(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    value: String = "",
    localizationComment comment: String = ""
  ) -> Setup {
    composed { (subject: Subject) in
      subject.placeholder = NSLocalizedString(
        key,
        tableName: tableName,
        bundle: bundle,
        value: value,
        comment: comment
      )
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
  
  @inlinable func searchBarStyle(_ style: UISearchBar.Style) -> Setup {
      composed { (subject: Subject) in
          subject.searchBarStyle = style
      }
  }
  
  @inlinable func returnKeyType(_ type: UIReturnKeyType) -> Setup {
      composed { (subject: Subject) in
          subject.returnKeyType = type
      }
  }
  
  @inlinable func searchFieldBackgroundImage(
      _ image: UIImage?,
      forState state: UIControl.State = .normal
  ) -> Setup {
      composed { (subject: Subject) in
          subject.setSearchFieldBackgroundImage(image, for: state)
      }
  }
  
  @inlinable func searchFieldBackgroundImage(
      named imageName: String,
      from bundle: Bundle? = nil,
      compatibleWith traitCollection: UITraitCollection? = nil,
      forState state: UIControl.State = .normal
  ) -> Setup {
      composed { (subject: Subject) in
          subject.setSearchFieldBackgroundImage(
              UIImage(
                  named: imageName,
                  in: bundle,
                  compatibleWith: traitCollection
              ),
              for: state
          )
      }
  }
  
  @inlinable func searchTextPositionAdjustment(_ adjustment: UIOffset) -> Setup {
      composed { (subject: Subject) in
          subject.searchTextPositionAdjustment = adjustment
      }
  }
  
  @inlinable func iconPositionAdjustment(
      _ offset: UIOffset,
      for icon: UISearchBar.Icon
  ) -> Setup {
      composed { (subject: Subject) in
          subject.setPositionAdjustment(offset, for: icon)
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
