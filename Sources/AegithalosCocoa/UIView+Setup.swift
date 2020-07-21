#if canImport(UIKit)

import UIKit
import Aegithalos

extension UIView: SetupInstantiable {

  public class func instantiateForSetup() -> Self {
    Self()
  }
}

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
    = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner],
    masksToBounds: Bool = false
  ) -> Setup {
    composed { (subject: Subject) in
      subject.layer.cornerRadius = radius
      subject.layer.maskedCorners = corners
      subject.layer.masksToBounds = masksToBounds
    }
  }
  
  func shadow(
    color: UIColor = .black,
    opacity: Float = 0.25,
    offset: CGSize = CGSize(width: 0, height: 2),
    radius: CGFloat = 4
  ) -> Setup {
    composed { (subject: Subject) in
      subject.layer.shadowColor = color.cgColor
      subject.layer.shadowOpacity = opacity
      subject.layer.shadowOffset = offset
      subject.layer.shadowRadius = radius
      subject.layer.masksToBounds = false
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
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.topAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func bottom(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.bottomAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func centerY(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.centerYAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func left(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.leftAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func leading(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.leadingAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func right(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.rightAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func trailing(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.trailingAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func centerX(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { [unowned anchor] (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.centerXAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func width(
    _ relation: LayoutConstraintRelation = .equalTo,
    _ constant: CGFloat,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { (subject: Subject) in
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.widthAnchor.constraint(equalToConstant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.widthAnchor.constraint(lessThanOrEqualToConstant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func height(
    _ relation: LayoutConstraintRelation = .equalTo,
    _ constant: CGFloat,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { (subject: Subject) in
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.heightAnchor.constraint(equalToConstant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.heightAnchor.constraint(lessThanOrEqualToConstant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func width(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutDimension>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { (subject: Subject) in
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.widthAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.widthAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.widthAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
      constraint.priority = priority
      constraint.isActive = true
    }
  }
  
  @inlinable func height(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutDimension>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required
  ) -> Setup {
    composed { (subject: Subject) in
      let constraint: NSLayoutConstraint
      switch relation {
      case .equalTo:
        constraint = subject.heightAnchor.constraint(equalTo: anchor, constant: constant)
      case .lessThanOrEqualTo:
        constraint = subject.heightAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
      case .greaterThanOrEqualTo:
        constraint = subject.heightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
      }
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
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraints: Array<NSLayoutConstraint>
      if useSafeArea {
        constraints = [
          subject.topAnchor.constraint(equalTo: other.safeAreaLayoutGuide.topAnchor, constant: -insets.top),
          subject.leftAnchor.constraint(equalTo: other.safeAreaLayoutGuide.leftAnchor, constant: -insets.left),
          subject.rightAnchor.constraint(equalTo: other.safeAreaLayoutGuide.rightAnchor, constant: insets.right),
          subject.bottomAnchor.constraint(equalTo: other.safeAreaLayoutGuide.bottomAnchor, constant: insets.bottom),
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
  
  @inlinable func contentHugging(_ axis: NSLayoutConstraint.Axis, priority: UILayoutPriority) -> Setup {
    composed { (subject: Subject) in
      subject.setContentHuggingPriority(priority, for: axis)
    }
  }
  
  @inlinable func contentCompressionResistance(_ axis: NSLayoutConstraint.Axis, priority: UILayoutPriority) -> Setup {
    composed { (subject: Subject) in
      subject.setContentCompressionResistancePriority(priority, for: axis)
    }
  }
}

#endif
