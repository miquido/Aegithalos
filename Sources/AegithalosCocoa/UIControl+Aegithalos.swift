#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UIControl {
  
  @inlinable static func contentHorizontalAlignment(_ value: UIControl.ContentHorizontalAlignment) -> Self {
    Self { (subject: Subject) in
      subject.contentHorizontalAlignment = value
    }
  }
  
  @inlinable static func contentVerticalAlignment(_ value: UIControl.ContentVerticalAlignment) -> Self {
    Self { (subject: Subject) in
      subject.contentVerticalAlignment = value
    }
  }
  
  @inlinable static func action(
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
  
  @inlinable static func action(
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
