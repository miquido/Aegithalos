#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UIScrollView {

    @inlinable public static func showsVerticalScrollIndicator(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.showsVerticalScrollIndicator = value
      }
    }

    @inlinable public static func showsHorizontalScrollIndicator(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.showsHorizontalScrollIndicator = value
      }
    }

    @inlinable public static func contentInset(_ value: UIEdgeInsets) -> Self {
      Self { (subject: Subject) in
        subject.contentInset = value
      }
    }

    @inlinable public static func pagingEnabled(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.isPagingEnabled = value
      }
    }

    @inlinable public static func bounces(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.bounces = value
      }
    }

    @inlinable public static func delegate(_ value: UIScrollViewDelegate) -> Self {
      .custom { [unowned value] (subject: Subject) in
        subject.delegate = value
      }
    }
  }

#endif
