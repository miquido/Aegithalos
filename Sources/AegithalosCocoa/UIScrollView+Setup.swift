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

#endif
