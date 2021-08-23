#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UINavigationBar {

    @inlinable public static func barStyle(_ value: UIBarStyle) -> Self {
      Self { (subject: Subject) in
        subject.barStyle = value
      }
    }

    @inlinable public static func barTintColor(_ value: UIColor) -> Self {
      Self { (subject: Subject) in
        subject.barTintColor = value
      }
    }

    @inlinable public static func shadowImage(_ value: UIImage?) -> Self {
      Self { (subject: Subject) in
        subject.shadowImage = value
      }
    }

    @inlinable public static func tintColor(_ value: UIColor) -> Self {
      Self { (subject: Subject) in
        subject.tintColor = value
      }
    }

    @inlinable public static func translucent(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.isTranslucent = value
      }
    }

    @inlinable public static func prefersLargeTitles(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.prefersLargeTitles = value
      }
    }

    @inlinable public static func titleTextAttributes(_ value: [NSAttributedString.Key: Any])
      -> Self
    {
      Self { (subject: Subject) in
        subject.titleTextAttributes = value
      }
    }

    @inlinable public static func delegate(_ value: UINavigationBarDelegate) -> Self {
      .custom { [unowned value] (subject: Subject) in
        subject.delegate = value
      }
    }

    @inlinable public static func backgroundImage(
      _ image: UIImage?,
      for position: UIBarPosition = .any,
      barMetrics: UIBarMetrics = .default
    ) -> Self {
      Self { (subject: Subject) in
        subject.setBackgroundImage(
          image,
          for: position,
          barMetrics: barMetrics
        )
      }
    }

    @inlinable public static func backgroundImage(
      named imageName: ImageNameConstant,
      from bundle: Bundle? = nil,
      compatibleWith traitCollection: UITraitCollection? = nil,
      for position: UIBarPosition = .any,
      barMetrics: UIBarMetrics = .default
    ) -> Self {
      Self { (subject: Subject) in
        subject.setBackgroundImage(
          UIImage(
            named: imageName.rawValue,
            in: bundle,
            compatibleWith: traitCollection
          ),
          for: position,
          barMetrics: barMetrics
        )
      }
    }
  }
#endif
