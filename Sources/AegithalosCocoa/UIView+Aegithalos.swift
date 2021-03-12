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
  
  @inlinable func subview(of other: UIView) -> Setup {
    composed { [unowned other] (subject: Subject) in
      other.addSubview(subject)
    }
  }
  
  @inlinable func arrangedSubview(of stackView: UIStackView) -> Setup {
    composed { [unowned stackView] (subject: Subject) in
      stackView.addArrangedSubview(subject)
    }
  }
  
  @inlinable func top(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func bottom(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func centerY(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func left(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func leading(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func right(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func trailing(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func centerX(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func width(
    _ relation: LayoutConstraintRelation = .equalTo,
    _ constant: CGFloat,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func height(
    _ relation: LayoutConstraintRelation = .equalTo,
    _ constant: CGFloat,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func width(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutDimension>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable func height(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutDimension>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
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
  
  @inlinable func gestureRecognizer(_ recognizer: UIGestureRecognizer) -> Setup {
    composed { [unowned recognizer] (subject: Subject) in
      subject.addGestureRecognizer(recognizer)
    }
  }
  
  @inlinable func tapGesture(
    requiredTaps: Int = 1,
    requiredTouches: Int = 1,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UITapGestureRecognizer?>? = nil,
    _ closure: @escaping (UITapGestureRecognizer) -> Void
  ) -> Setup {
    composed { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UITapGestureRecognizer()
      gestureRecognizer.numberOfTapsRequired = requiredTaps
      gestureRecognizer.numberOfTouchesRequired = requiredTouches
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable func swipeGesture(
    _ direction: UISwipeGestureRecognizer.Direction,
    requiredTouches: Int = 1,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UISwipeGestureRecognizer?>? = nil,
    _ closure: @escaping (UISwipeGestureRecognizer) -> Void
  ) -> Setup {
    composed { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UISwipeGestureRecognizer()
      gestureRecognizer.numberOfTouchesRequired = requiredTouches
      gestureRecognizer.direction = direction
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable func panGesture(
    minimumTouches: Int = 1,
    maximumTouches: Int = .max,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UIPanGestureRecognizer?>? = nil,
    _ closure: @escaping (UIPanGestureRecognizer) -> Void
  ) -> Setup {
    composed { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UIPanGestureRecognizer()
      gestureRecognizer.minimumNumberOfTouches = minimumTouches
      gestureRecognizer.maximumNumberOfTouches = maximumTouches
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable func pinchGesture(
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UIPinchGestureRecognizer?>? = nil,
    _ closure: @escaping (UIPinchGestureRecognizer) -> Void
  ) -> Setup {
    composed { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UIPinchGestureRecognizer()
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable func screenEdgePanGesture(
    edges: UIRectEdge,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UIScreenEdgePanGestureRecognizer?>? = nil,
    _ closure: @escaping (UIScreenEdgePanGestureRecognizer) -> Void
  ) -> Setup {
    composed { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UIScreenEdgePanGestureRecognizer()
      gestureRecognizer.edges = edges
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable func longPressGesture(
    requiredTaps: Int = 0,
    requiredTouches: Int = 1,
    minimumPressDuration: TimeInterval = 0.5,
    allowableMovement: CGFloat = 10,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UILongPressGestureRecognizer?>? = nil,
    _ closure: @escaping (UILongPressGestureRecognizer) -> Void
  ) -> Setup {
    composed { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UILongPressGestureRecognizer()
      gestureRecognizer.numberOfTapsRequired = requiredTaps
      gestureRecognizer.numberOfTouchesRequired = requiredTouches
      gestureRecognizer.minimumPressDuration = minimumPressDuration
      gestureRecognizer.allowableMovement = allowableMovement
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
}

// MARK: - Mutation

public extension Mutation where Subject: UIView {
  
  @inlinable static func cornerRadius(
    _ radius: CGFloat,
    corners: CACornerMask = [
      .layerMaxXMaxYCorner,
      .layerMaxXMinYCorner,
      .layerMinXMaxYCorner,
      .layerMinXMinYCorner
    ],
    masksToBounds: Bool = false
  ) -> Self {
    Self { (subject: Subject) in
      subject.layer.cornerRadius = radius
      subject.layer.maskedCorners = corners
      subject.layer.masksToBounds = masksToBounds
    }
  }
  
  @inlinable static func shadow(
    color: UIColor = .black,
    opacity: Float = 0.25,
    offset: CGSize = CGSize(width: 0, height: 2),
    radius: CGFloat = 4
  ) -> Self {
    Self { (subject: Subject) in
      subject.layer.shadowColor = color.cgColor
      subject.layer.shadowOpacity = opacity
      subject.layer.shadowOffset = offset
      subject.layer.shadowRadius = radius
      subject.layer.masksToBounds = false
    }
  }
  
  @inlinable static func border(
    width: CGFloat,
    color: UIColor
  ) -> Self {
    Self { (subject: Subject) in
      subject.layer.borderWidth = width
      subject.layer.borderColor = color.cgColor
    }
  }
  
  @inlinable static func backgroundColor(_ value: UIColor?) -> Self {
    Self { (subject: Subject) in
      subject.backgroundColor = value
    }
  }
  
  @inlinable static func tintColor(_ value: UIColor?) -> Self {
    Self { (subject: Subject) in
      subject.tintColor = value
    }
  }
  
  @inlinable static func clipsToBounds(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.clipsToBounds = value
    }
  }
  
  @inlinable static func hidden(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isHidden = value
    }
  }
  
  @inlinable static func alpha(_ value: CGFloat) -> Self {
    Self { (subject: Subject) in
      subject.alpha = value
    }
  }
  
  @inlinable static func userInteractionEnabled(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isUserInteractionEnabled = value
    }
  }
  
  @inlinable static func transform(_ value: CGAffineTransform) -> Self {
    Self { (subject: Subject) in
      subject.transform = value
    }
  }
  
  @inlinable static func contentMode(_ value: UIView.ContentMode) -> Self {
    Self { (subject: Subject) in
      subject.contentMode = value
    }
  }
  
  @inlinable static func translatesAutoresizingMaskIntoConstraints(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = value
    }
  }
  
  @inlinable static func subview(
    _ views: UIView...
  ) -> Self {
    Self { (subject: Subject) in
      for view in views {
        Swift.assert(view.superview == nil, "View reuse is usually a bug.")
        subject.addSubview(view)
      }
    }
  }
  
  @inlinable static func subview(
    of other: UIView
  ) -> Self {
    Self { (subject: Subject) in
      other.addSubview(subject)
    }
  }
  
  @inlinable static func arrangedSubview(
    of stackView: UIStackView
  ) -> Self {
    Self { (subject: Subject) in
      stackView.addArrangedSubview(subject)
    }
  }
  
  @inlinable static func topAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func bottomAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func centerYAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func leftAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func leadingAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func rightAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func trailingAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func centerXAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func widthAnchor(
    _ relation: LayoutConstraintRelation,
    _ constant: CGFloat,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func heightAnchor(
    _ relation: LayoutConstraintRelation,
    _ constant: CGFloat,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func widthAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutDimension>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func heightAnchor(
    _ relation: LayoutConstraintRelation,
    _ anchor: NSLayoutAnchor<NSLayoutDimension>,
    constant: CGFloat = 0,
    priority: UILayoutPriority = .required,
    identifier: String? = nil,
    referenceOutput: UnsafeMutablePointer<NSLayoutConstraint?>? = nil
  ) -> Self {
    Self { (subject: Subject) in
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
      constraint.identifier = identifier
      referenceOutput?.pointee = constraint
    }
  }
  
  @inlinable static func edges(
    equalTo other: UIView,
    insets: UIEdgeInsets = .zero,
    priority: UILayoutPriority = .required,
    usingSafeArea: Bool = true
  ) -> Self {
    Self { (subject: Subject) in
      subject.translatesAutoresizingMaskIntoConstraints = false
      let constraints: Array<NSLayoutConstraint>
      if usingSafeArea {
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
  
  @inlinable static func contentHugging(
    _ axis: NSLayoutConstraint.Axis,
    priority: UILayoutPriority
  ) -> Self {
    Self { (subject: Subject) in
      subject.setContentHuggingPriority(priority, for: axis)
    }
  }
  
  @inlinable static func contentCompressionResistance(
    _ axis: NSLayoutConstraint.Axis,
    priority: UILayoutPriority
  ) -> Self {
    Self { (subject: Subject) in
      subject.setContentCompressionResistancePriority(priority, for: axis)
    }
  }
  
  @inlinable static func gestureRecognizer(
    _ recognizer: UIGestureRecognizer
  ) -> Self {
    Self { (subject: Subject) in
      subject.addGestureRecognizer(recognizer)
    }
  }
  
  @inlinable static func tapGesture(
    requiredTaps: Int = 1,
    requiredTouches: Int = 1,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UITapGestureRecognizer?>? = nil,
    _ closure: @escaping (UITapGestureRecognizer) -> Void
  ) -> Self {
    .custom { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UITapGestureRecognizer()
      gestureRecognizer.numberOfTapsRequired = requiredTaps
      gestureRecognizer.numberOfTouchesRequired = requiredTouches
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable static func swipeGesture(
    _ direction: UISwipeGestureRecognizer.Direction,
    requiredTouches: Int = 1,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UISwipeGestureRecognizer?>? = nil,
    _ closure: @escaping (UISwipeGestureRecognizer) -> Void
  ) -> Self {
    .custom { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UISwipeGestureRecognizer()
      gestureRecognizer.numberOfTouchesRequired = requiredTouches
      gestureRecognizer.direction = direction
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable static func panGesture(
    minimumTouches: Int = 1,
    maximumTouches: Int = .max,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UIPanGestureRecognizer?>? = nil,
    _ closure: @escaping (UIPanGestureRecognizer) -> Void
  ) -> Self {
    .custom { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UIPanGestureRecognizer()
      gestureRecognizer.minimumNumberOfTouches = minimumTouches
      gestureRecognizer.maximumNumberOfTouches = maximumTouches
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable static func pinchGesture(
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UIPinchGestureRecognizer?>? = nil,
    _ closure: @escaping (UIPinchGestureRecognizer) -> Void
  ) -> Self {
    .custom { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UIPinchGestureRecognizer()
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable static func screenEdgePanGesture(
    edges: UIRectEdge,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UIScreenEdgePanGestureRecognizer?>? = nil,
    _ closure: @escaping (UIScreenEdgePanGestureRecognizer) -> Void
  ) -> Self {
    .custom { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UIScreenEdgePanGestureRecognizer()
      gestureRecognizer.edges = edges
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
  
  @inlinable static func longPressGesture(
    requiredTaps: Int = 0,
    requiredTouches: Int = 1,
    minimumPressDuration: TimeInterval = 0.5,
    allowableMovement: CGFloat = 10,
    cancelsTouchesInView: Bool = false,
    delaysTouchesBegan: Bool = false,
    delaysTouchesEnded: Bool = true,
    requireToFail requiredToFail: Array<UIGestureRecognizer> = [],
    delegate: UIGestureRecognizerDelegate? = nil,
    referenceOutput: UnsafeMutablePointer<UILongPressGestureRecognizer?>? = nil,
    _ closure: @escaping (UILongPressGestureRecognizer) -> Void
  ) -> Self {
    .custom { [unowned delegate] (subject: Subject) in
      let gestureRecognizer = UILongPressGestureRecognizer()
      gestureRecognizer.numberOfTapsRequired = requiredTaps
      gestureRecognizer.numberOfTouchesRequired = requiredTouches
      gestureRecognizer.minimumPressDuration = minimumPressDuration
      gestureRecognizer.allowableMovement = allowableMovement
      requiredToFail.forEach(gestureRecognizer.require(toFail:))
      gestureRecognizer.delegate = delegate
      gestureRecognizer.cancelsTouchesInView = cancelsTouchesInView
      gestureRecognizer.delaysTouchesBegan = delaysTouchesBegan
      gestureRecognizer.delaysTouchesEnded = delaysTouchesEnded
      let closureHolder = ClosureHolder({ [unowned gestureRecognizer] _ in closure(gestureRecognizer) })
      gestureRecognizer.addTarget(closureHolder, action: #selector(ClosureHolder.invoke(with:)))
      gestureRecognizer.associate(closureHolder)
      subject.addGestureRecognizer(gestureRecognizer)
      referenceOutput?.pointee = gestureRecognizer
    }
  }
}

extension UIView: EmptyInstantiable {}

#endif
