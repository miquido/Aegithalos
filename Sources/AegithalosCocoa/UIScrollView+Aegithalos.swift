#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIScrollView {
  
  @inlinable func showsVerticalScrollIndicator(_ shows: Bool) -> Setup {
    composed { (subject: Subject) in subject.showsVerticalScrollIndicator = shows }
  }
  
  @inlinable func showsHorizontalScrollIndicator(_ shows: Bool) -> Setup {
    composed { (subject: Subject) in subject.showsHorizontalScrollIndicator = shows }
  }
  
  @inlinable func contentInset(_ inset: UIEdgeInsets) -> Setup {
    composed { (subject: Subject) in subject.contentInset = inset }
  }
  
  @inlinable func isPagingEnabled(_ enabled: Bool) -> Setup {
    composed { (subject: Subject) in subject.isPagingEnabled = enabled }
  }
  
  @inlinable func bounces(_ bounces: Bool) -> Setup {
    composed { (subject: Subject) in subject.bounces = bounces }
  }
  
  @inlinable func delegate(_ delegate: UIScrollViewDelegate) -> Setup {
    composed { [unowned delegate] (subject: Subject) in subject.delegate = delegate }
  }
}


// MARK: - Mutation

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
