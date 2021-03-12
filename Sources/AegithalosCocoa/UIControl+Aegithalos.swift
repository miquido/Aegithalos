#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIControl {
  
  @inlinable func contentHorizontalAlignment(_ alignment: UIControl.ContentHorizontalAlignment) -> Setup {
    composed { (subject: Subject) in subject.contentHorizontalAlignment = alignment }
  }
  
  @inlinable func contentVerticalAlignment(_ alignment: UIControl.ContentVerticalAlignment) -> Setup {
    composed { (subject: Subject) in subject.contentVerticalAlignment = alignment }
  }
  
  @inlinable func target(_ target: Any & NSObjectProtocol, action: Selector, for event: UIControl.Event = .touchUpInside) -> Setup {
    composed { [unowned target] (subject: Subject) in subject.addTarget(target, action: action, for: event) }
  }
  
  @inlinable func action(_ closure: @escaping () -> Void, for event: UIControl.Event = .touchUpInside) -> Setup {
    composed { (subject: Subject) in subject.addAction(closure, for: event) }
  }
  
  @inlinable func action(_ closure: @escaping (Subject) -> Void, for event: UIControl.Event = .touchUpInside) -> Setup {
    composed { (subject: Subject) in subject.addAction({ [weak subject] in subject.map(closure) }, for: event ) }
  }
}

// MARK: - Mutation

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
    _ value: Optional<() -> Void>,
    for event: UIControl.Event = .touchUpInside
  ) -> Self {
    Self { (subject: Subject) in
      if let closure = value {
        subject.addAction(closure, for: event)
      } else {
        subject.removeActions(for: event)
      }
    }
  }
  
  @inlinable static func action(
    _ value: Optional<(Subject) -> Void>,
    for event: UIControl.Event = .touchUpInside
  ) -> Self {
    Self { (subject: Subject) in
      if let closure = value {
        subject.addAction(
          { [weak subject] in
            subject.map(closure)
          },
          for: event
        )
      } else {
        subject.removeActions(for: event)
      }
    }
  }
}
#endif
