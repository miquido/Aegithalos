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
  
  @inlinable static func target(
    _ target: Any & NSObjectProtocol,
    action: Selector,
    for event: UIControl.Event = .touchUpInside
  ) -> Self {
    .custom { [unowned target] (subject: Subject) in
      subject.addTarget(target, action: action, for: event)
    }
  }
  
  @inlinable static func action(
    _ closure: @escaping () -> Void,
    for event: UIControl.Event = .touchUpInside
  ) -> Self {
    .custom { (subject: Subject) in
      subject.addAction(closure, for: event)
    }
  }
  
  @inlinable static func action(
    _ closure: @escaping (Subject) -> Void,
    for event: UIControl.Event = .touchUpInside
  ) -> Self {
    .custom { (subject: Subject) in
      subject.addAction(
        { [weak subject] in
          subject.map(closure)
        },
        for: event
      )
    }
  }
  
  @inlinable static func noActions(
    for event: UIControl.Event = .touchUpInside
  ) -> Self {
    .custom { (subject: Subject) in
      subject.removeTarget(nil, action: nil, for: event)
    }
  }
}
#endif
