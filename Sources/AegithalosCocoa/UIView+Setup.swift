#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIView {
  
  @inlinable func frame(_ frame: CGRect) -> Setup {
    composed { view in view.frame = frame }
  }
  
  @inlinable func center(_ center: CGPoint) -> Setup {
    composed { view in view.center = center }
  }
  
  @inlinable func size(_ size: CGSize, preserveCenter: Bool = false) -> Setup {
    composed { view in
      view.frame
        = preserveCenter
        ? CGRect(center: view.frame.center, size: size)
        : CGRect(origin: view.frame.origin, size: size)
    }
  }
  
  @inlinable func cornerRadius(
    _ radius: CGFloat,
    corners: CACornerMask
    = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
  ) -> Setup {
    composed { view in
      view.layer.cornerRadius = radius
      view.layer.maskedCorners = corners
    }
  }
  
  @inlinable func borderWidth(_ width: CGFloat) -> Setup {
    composed { view in view.layer.borderWidth = width }
  }
  
  @inlinable func borderColor(_ color: UIColor?) -> Setup {
    composed { view in view.layer.borderColor = color?.cgColor }
  }
  
  @inlinable func backgroundColor(_ color: UIColor?) -> Setup {
    composed { view in view.backgroundColor = color }
  }
  
  @inlinable func tintColor(_ color: UIColor?) -> Setup {
    composed { view in view.tintColor = color }
  }
  
  @inlinable func clipsToBounds(_ clipsToBounds: Bool) -> Setup {
    composed { view in view.clipsToBounds = clipsToBounds }
  }
  
  @inlinable func isHidden(_ isHidden: Bool) -> Setup {
    composed { view in view.isHidden = isHidden }
  }
  
  @inlinable func alpha(_ alpha: CGFloat) -> Setup {
    composed { view in view.alpha = alpha }
  }
  
  @inlinable func isUserInteractionEnabled(_ enabled: Bool) -> Setup {
    composed { view in view.isUserInteractionEnabled = enabled }
  }
  
  @inlinable func transform(_ transform: CGAffineTransform) -> Setup {
    composed { view in view.transform = transform }
  }
  
  @inlinable func contentMode(_ mode: UIView.ContentMode) -> Setup {
    composed { view in view.contentMode = mode }
  }
  
  @inlinable func translatesAutoresizingMaskIntoConstraints(_ translates: Bool) -> Setup {
    composed { view in view.translatesAutoresizingMaskIntoConstraints = translates }
  }
  
  @inlinable func subview(_ other: UIView) -> Setup {
    composed { [unowned other] view in
      assert(other.superview == nil)
      view.addSubview(other)
    }
  }
  
  @inlinable func subviews(_ views: UIView...) -> Setup {
     composed { view in // we should pass unowned references for views
      for other in views {
         assert(other.superview == nil)
         view.addSubview(other)
      }
     }
   }
  
  @inlinable func top(
    equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraint = view.topAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func bottom(
    equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraint = view.bottomAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func centerY(
    equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraint = view.centerYAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func left(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraint = view.leftAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func leading(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraint = view.leadingAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func right(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraint = view.rightAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func trailing(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraint = view.trailingAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func centerX(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraint = view.centerXAnchor.constraint(equalTo: anchor, constant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func width(
    equalTo constant: CGFloat,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { view in
      let constraint = view.widthAnchor.constraint(equalToConstant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func height(
    equalTo constant: CGFloat,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { view in
      let constraint = view.heightAnchor.constraint(equalToConstant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func edges(
    equalTo other: UIView,
    insets: UIEdgeInsets = .zero,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned other] view in
      view.translatesAutoresizingMaskIntoConstraints = false
      let constraints: Array<NSLayoutConstraint>
      if useSafeArea {
        constraints = [
          view.topAnchor.constraint(equalTo: other.safeAreaLayoutGuide.topAnchor, constant: -insets.top),
          view.leftAnchor.constraint(equalTo: other.safeAreaLayoutGuide.leftAnchor, constant: -insets.left),
          view.rightAnchor.constraint(equalTo: other.safeAreaLayoutGuide.rightAnchor, constant: insets.right),
          view.bottomAnchor.constraint(equalTo: other.safeAreaLayoutGuide.bottomAnchor, constant: insets.bottom),
        ]
      } else {
        constraints = [
          view.topAnchor.constraint(equalTo: other.topAnchor, constant: -insets.top),
          view.leftAnchor.constraint(equalTo: other.leftAnchor, constant: -insets.left),
          view.rightAnchor.constraint(equalTo: other.rightAnchor, constant: insets.right),
          view.bottomAnchor.constraint(equalTo: other.bottomAnchor, constant: insets.bottom),
        ]
      }
      
      for constraint in constraints {
        constraint.priority = priority
        constraint.isActive = true
      }
    }
  }
  
  @inlinable func hugging(_ axis: NSLayoutConstraint.Axis, priority: UILayoutPriority) -> Setup {
    composed { view in
      view.setContentHuggingPriority(priority, for: axis)
    }
  }
  
  @inlinable func compressionResistance(_ axis: NSLayoutConstraint.Axis, priority: UILayoutPriority) -> Setup {
    composed { view in
      view.setContentCompressionResistancePriority(priority, for: axis)
    }
  }
}

#endif
