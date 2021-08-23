#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UIImageView {

    @inlinable public static func image(
      _ value: UIImage
    ) -> Self {
      Self { (subject: Subject) in
        subject.image = value
      }
    }

    @inlinable public static func image(
      named imageName: ImageNameConstant,
      from bundle: Bundle? = nil,
      compatibleWith traitCollection: UITraitCollection? = nil
    ) -> Self {
      Self { (subject: Subject) in
        subject.image = UIImage(
          named: imageName.rawValue,
          in: bundle,
          compatibleWith: traitCollection
        )
      }
    }

    @available(iOS 13.0, *)
    @inlinable public static func image(
      symbol symbolName: String,
      compatibleWith traitCollection: UITraitCollection? = nil
    ) -> Self {
      Self { (subject: Subject) in
        subject.image = UIImage(
          systemName: symbolName,
          compatibleWith: traitCollection
        )
      }
    }
  }

#endif
