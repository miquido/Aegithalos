#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIView {
  
  @inlinable func frame(_ frame: CGRect) -> Setup {
    composed { (subject: Subject) in subject.frame = frame }
  }
  
  @inlinable func center(_ center: CGPoint) -> Setup {
    composed { (subject: Subject) in subject.center = center }
  }
  
  @inlinable func size(_ size: CGSize, preserveCenter: Bool = false) -> Setup {
    composed { (subject: Subject) in
      subject.frame
        = preserveCenter
        ? CGRect(center: subject.frame.center, size: size)
        : CGRect(origin: subject.frame.origin, size: size)
    }
  }
  
  @inlinable func cornerRadius(
    _ radius: CGFloat,
    corners: CACornerMask
    = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
  ) -> Setup {
    composed { (subject: Subject) in
      subject.layer.cornerRadius = radius
      subject.layer.maskedCorners = corners
    }
  }
  
  @inlinable func borderWidth(_ width: CGFloat) -> Setup {
    composed { (subject: Subject) in subject.layer.borderWidth = width }
  }
  
  @inlinable func borderColor(_ color: UIColor?) -> Setup {
    composed { (subject: Subject) in subject.layer.borderColor = color?.cgColor }
  }
  
  @inlinable func backgroundColor(_ color: UIColor?) -> Setup {
    composed { (subject: Subject) in subject.backgroundColor = color }
  }
  
  @inlinable func tintColor(_ color: UIColor?) -> Setup {
    composed { (subject: Subject) in subject.tintColor = color }
  }
  
  @inlinable func clipsToBounds(_ clipsToBounds: Bool) -> Setup {
    composed { (subject: Subject) in subject.clipsToBounds = clipsToBounds }
  }
  
  @inlinable func isHidden(_ isHidden: Bool) -> Setup {
    composed { (subject: Subject) in subject.isHidden = isHidden }
  }
  
  @inlinable func alpha(_ alpha: CGFloat) -> Setup {
    composed { (subject: Subject) in subject.alpha = alpha }
  }
  
  @inlinable func isUserInteractionEnabled(_ enabled: Bool) -> Setup {
    composed { (subject: Subject) in subject.isUserInteractionEnabled = enabled }
  }
  
  @inlinable func transform(_ transform: CGAffineTransform) -> Setup {
    composed { (subject: Subject) in subject.transform = transform }
  }
  
  @inlinable func contentMode(_ mode: UIView.ContentMode) -> Setup {
    composed { (subject: Subject) in subject.contentMode = mode }
  }
  
  @inlinable func translatesAutoresizingMaskIntoConstraints(_ translates: Bool) -> Setup {
    composed { (subject: Subject) in subject.translatesAutoresizingMaskIntoConstraints = translates }
  }
  
  @inlinable func subview(_ other: UIView) -> Setup {
    composed { [unowned other] (subject: Subject) in
      assert(other.superview == nil)
      subject.addSubview(other)
    }
  }
  
  @inlinable func subviews(_ views: UIView...) -> Setup {
     composed { (subject: Subject) in // we should pass unowned references for views
      for other in views {
         assert(other.superview == nil)
         subject.addSubview(other)
      }
     }
   }
  
  @inlinable func top(
    equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      let constraint: NSLayoutConstraint
      if useSafeArea {
        constraint = subject.safeAreaLayoutGuide.topAnchor.constraint(equalTo: anchor, constant: constant)
      } else {
        constraint = subject.topAnchor.constraint(equalTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func bottom(
    equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      let constraint: NSLayoutConstraint
      if useSafeArea {
        constraint = subject.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: anchor, constant: constant)
      } else {
        constraint = subject.bottomAnchor.constraint(equalTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func centerY(
    equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      let constraint: NSLayoutConstraint
      if useSafeArea {
        constraint = subject.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: anchor, constant: constant)
      } else {
        constraint = subject.centerYAnchor.constraint(equalTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func left(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      let constraint: NSLayoutConstraint
      if useSafeArea {
        constraint = subject.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: anchor, constant: constant)
      } else {
        constraint = subject.leftAnchor.constraint(equalTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func leading(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      let constraint: NSLayoutConstraint
      if useSafeArea {
        constraint = subject.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: anchor, constant: constant)
      } else {
        constraint = subject.leadingAnchor.constraint(equalTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func right(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      let constraint: NSLayoutConstraint
      if useSafeArea {
        constraint = subject.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: anchor, constant: constant)
      } else {
        constraint = subject.rightAnchor.constraint(equalTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func trailing(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      let constraint: NSLayoutConstraint
      if useSafeArea {
        constraint = subject.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: anchor, constant: constant)
      } else {
        constraint = subject.trailingAnchor.constraint(equalTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func centerX(
    equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    useSafeArea: Bool = true
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      let constraint: NSLayoutConstraint
      if useSafeArea {
        constraint = subject.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: anchor, constant: constant)
      } else {
        constraint = subject.centerXAnchor.constraint(equalTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func width(
    equalTo constant: CGFloat,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { (subject: Subject) in
      let constraint = subject.widthAnchor.constraint(equalToConstant: constant)
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func height(
    equalTo constant: CGFloat,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { (subject: Subject) in
      let constraint = subject.heightAnchor.constraint(equalToConstant: constant)
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
    composed { [unowned other] (subject: Subject) in
      let constraints: Array<NSLayoutConstraint>
      if useSafeArea {
        constraints = [
          subject.safeAreaLayoutGuide.topAnchor.constraint(equalTo: other.safeAreaLayoutGuide.topAnchor, constant: -insets.top),
          subject.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: other.safeAreaLayoutGuide.leftAnchor, constant: -insets.left),
          subject.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: other.safeAreaLayoutGuide.rightAnchor, constant: insets.right),
          subject.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: other.safeAreaLayoutGuide.bottomAnchor, constant: insets.bottom),
        ]
      } else {
        constraints = [
          subject.topAnchor.constraint(equalTo: other.topAnchor, constant: -insets.top),
          subject.leftAnchor.constraint(equalTo: other.leftAnchor, constant: -insets.left),
          subject.rightAnchor.constraint(equalTo: other.rightAnchor, constant: insets.right),
          subject.bottomAnchor.constraint(equalTo: other.bottomAnchor, constant: insets.bottom),
        ]
      }
      
      for constraint in constraints {
        constraint.priority = priority
        constraint.isActive = true
      }
    }
  }
}

#endif
