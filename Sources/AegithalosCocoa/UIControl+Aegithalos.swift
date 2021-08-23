#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UIControl {

    @inlinable public static func contentHorizontalAlignment(
      _ value: UIControl.ContentHorizontalAlignment
    ) -> Self {
      Self { (subject: Subject) in
        subject.contentHorizontalAlignment = value
      }
    }

    @inlinable public static func contentVerticalAlignment(
      _ value: UIControl.ContentVerticalAlignment
    ) -> Self {
      Self { (subject: Subject) in
        subject.contentVerticalAlignment = value
      }
    }

    @inlinable public static func action(
      _ value: @escaping () -> Void,
      replace: Bool = true,
      for event: UIControl.Event = .touchUpInside
    ) -> Self {
      Self { (subject: Subject) in
        if replace {
          subject.removeActions(for: event)
          subject.addAction(value, for: event)
        } else {
          subject.addAction(value, for: event)
        }
      }
    }

    @inlinable public static func action(
      _ value: @escaping (Subject) -> Void,
      replace: Bool = true,
      for event: UIControl.Event = .touchUpInside
    ) -> Self {
      Self { (subject: Subject) in
        if replace {
          subject.removeActions(for: event)
          subject.addAction(
            { [weak subject] in
              subject.map(value)
            },
            for: event
          )
        } else {
          subject.addAction(
            { [weak subject] in
              subject.map(value)
            },
            for: event
          )
        }
      }
    }
  }
#endif
