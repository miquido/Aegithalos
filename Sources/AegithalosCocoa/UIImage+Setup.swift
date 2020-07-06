#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIImageView {
  
  @inlinable func image(_ image: UIImage?) -> Setup {
    composed { imageView in imageView.image = image }
  }
  
  @inlinable func image(
    named imageName: String,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Setup {
    composed { imageView in
      imageView.image = UIImage(named: imageName, in: bundle, compatibleWith: traitCollection)
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable func image(
    symbol symbolName: String,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Setup {
    composed { imageView in
      imageView.image = UIImage(systemName: symbolName, compatibleWith: traitCollection)
    }
  }
}

#endif
