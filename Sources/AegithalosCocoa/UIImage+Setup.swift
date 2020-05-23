#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIImageView {
  
  @inlinable func image(_ image: UIImage?) -> Setup {
    composed { imageView in imageView.image = image }
  }
}

#endif
