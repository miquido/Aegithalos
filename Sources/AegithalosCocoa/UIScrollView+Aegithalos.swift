#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UIScrollView {
  
  @inlinable static func showsVerticalScrollIndicator(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.showsVerticalScrollIndicator = value
    }
  }
  
  @inlinable static func showsHorizontalScrollIndicator(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.showsHorizontalScrollIndicator = value
    }
  }
  
  @inlinable static func contentInset(_ value: UIEdgeInsets) -> Self {
    Self { (subject: Subject) in
      subject.contentInset = value
    }
  }
  
  @inlinable static func pagingEnabled(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isPagingEnabled = value
    }
  }
  
  @inlinable static func bounces(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.bounces = value
    }
  }
  
  @inlinable static func delegate(_ value: UIScrollViewDelegate) -> Self {
    .custom { [unowned value] (subject: Subject) in
      subject.delegate = value
    }
  }
}

#endif
