#if canImport(UIKit)
import UIKit
import Aegithalos
  
// MARK: - Mutations

public extension Mutation where Subject: UIStackView {
  
  @inlinable static func spacing(_ value: CGFloat) -> Self {
    Self { (subject: Subject) in
      subject.spacing = value
    }
  }
  
  @inlinable static func distribution(_ value: UIStackView.Distribution) -> Self {
    Self { (subject: Subject) in
      subject.distribution = value
    }
  }
  
  @inlinable static func alignment(_ value: UIStackView.Alignment) -> Self {
    Self { (subject: Subject) in
      subject.alignment = value
    }
  }
  
  @inlinable static func axis(_ value: NSLayoutConstraint.Axis) -> Self {
    Self { (subject: Subject) in
      subject.axis = value
    }
  }
  
  @inlinable static func layoutMargins(_ value: UIEdgeInsets) -> Self {
    Self { (subject: Subject) in
      subject.layoutMargins = value
    }
  }
  
  @inlinable static func layoutMarginsRelativeArrangement(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isLayoutMarginsRelativeArrangement = value
    }
  }
  
  @inlinable static func arrangedSubview(
    _ views: UIView...
  ) -> Self {
    Self { (subject: Subject) in
      for view in views {
        Swift.assert(view.superview == nil, "View reuse is usually a bug.")
        subject.addArrangedSubview(view)
      }
    }
  }
  
  @inlinable static func withoutArrangedSubviews() -> Self {
    Self { (subject: Subject) in
      subject.arrangedSubviews.forEach { arrangedSubview in
        subject.removeArrangedSubview(arrangedSubview)
        arrangedSubview.removeFromSuperview()
      }
    }
  }
}
#endif
