#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIScrollView {
  
  @inlinable func showsVerticalScrollIndicator(_ shows: Bool) -> Setup {
    composed { scrollView in scrollView.showsVerticalScrollIndicator = shows }
  }
  
  @inlinable func showsHorizontalScrollIndicator(_ shows: Bool) -> Setup {
    composed { scrollView in scrollView.showsHorizontalScrollIndicator = shows }
  }
  
  @inlinable func contentInset(_ inset: UIEdgeInsets) -> Setup {
    composed { scrollView in scrollView.contentInset = inset }
  }
  
  @inlinable func isPagingEnabled(_ enabled: Bool) -> Setup {
    composed { scrollView in scrollView.isPagingEnabled = enabled }
  }
}

#endif
