#if canImport(UIKit)

import UIKit
import Aegithalos
  
public extension Setup where Subject: UIStackView {
  
  @inlinable func arrangedSubview(_ view: UIView) -> Setup {
    composed { [unowned view] (subject: Subject) in
      assert(view.superview == nil)
      subject.addArrangedSubview(view)
    }
  }
  
  @inlinable func arrangedSubviews(_ views: UIView...) -> Setup {
    composed { (subject: Subject) in // we should pass unowned references for views
      for view in views {
        assert(view.superview == nil)
        subject.addArrangedSubview(view)
      }
    }
  }
  
  @inlinable func spacing(_ spacing: CGFloat) -> Setup {
    composed { (subject: Subject) in subject.spacing = spacing }
  }
  
  @inlinable func distribution(_ distribution: UIStackView.Distribution) -> Setup {
    composed { (subject: Subject) in subject.distribution = distribution }
  }
  
  @inlinable func alignment(_ alignment: UIStackView.Alignment) -> Setup {
    composed { (subject: Subject) in subject.alignment = alignment }
  }
  
  @inlinable func axis(_ axis: NSLayoutConstraint.Axis) -> Setup {
    composed { (subject: Subject) in subject.axis = axis }
  }
  
  @inlinable func layoutMargins(_ edgeInsets: UIEdgeInsets) -> Setup {
    composed { (subject: Subject) in subject.layoutMargins = edgeInsets }
  }
  
  @inlinable func isLayoutMarginsRelativeArrangement(_ isRelative: Bool) -> Setup {
    composed { (subject: Subject) in subject.isLayoutMarginsRelativeArrangement = isRelative }
  }
}

// MARK: - Mutation

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
