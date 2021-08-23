#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UIStackView {

    @inlinable public static func spacing(_ value: CGFloat) -> Self {
      Self { (subject: Subject) in
        subject.spacing = value
      }
    }

    @inlinable public static func distribution(_ value: UIStackView.Distribution) -> Self {
      Self { (subject: Subject) in
        subject.distribution = value
      }
    }

    @inlinable public static func alignment(_ value: UIStackView.Alignment) -> Self {
      Self { (subject: Subject) in
        subject.alignment = value
      }
    }

    @inlinable public static func axis(_ value: NSLayoutConstraint.Axis) -> Self {
      Self { (subject: Subject) in
        subject.axis = value
      }
    }

    @inlinable public static func layoutMargins(_ value: UIEdgeInsets) -> Self {
      Self { (subject: Subject) in
        subject.layoutMargins = value
      }
    }

    @inlinable public static func layoutMarginsRelativeArrangement(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.isLayoutMarginsRelativeArrangement = value
      }
    }

    @inlinable public static func arrangedSubview(
      _ views: UIView...
    ) -> Self {
      Self { (subject: Subject) in
        for view in views {
          Swift.assert(view.superview == nil, "View reuse is usually a bug.")
          subject.addArrangedSubview(view)
        }
      }
    }

    @inlinable public static func withoutArrangedSubviews() -> Self {
      Self { (subject: Subject) in
        subject.arrangedSubviews.forEach { arrangedSubview in
          subject.removeArrangedSubview(arrangedSubview)
          arrangedSubview.removeFromSuperview()
        }
      }
    }
  }
#endif
