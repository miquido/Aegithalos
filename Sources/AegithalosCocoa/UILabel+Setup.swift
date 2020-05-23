#if canImport(UIKit)

import UIKit
import Aegithalos
  
public extension Setup where Subject: UILabel {
  
  @inlinable func text(_ string: String) -> Setup {
    composed { label in label.text = string }
  }
  
  @inlinable func attributedText(_ attributedString: NSAttributedString) -> Setup {
    composed { label in label.attributedText = attributedString }
  }
  
  @inlinable func font(_ font: UIFont) -> Setup {
    composed { label in label.font = font }
  }
  
  @inlinable func textColor(_ color: UIColor) -> Setup {
    composed { label in label.textColor = color }
  }
  
  @inlinable func textAlignment(_ alignment: NSTextAlignment) -> Setup {
    composed { label in label.textAlignment = alignment }
  }
  
  @inlinable func numberOfLines(_ numberOfLines: Int) -> Setup {
    composed { label in label.numberOfLines = numberOfLines }
  }
  
  @inlinable func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Setup {
    composed { label in label.lineBreakMode = lineBreakMode }
  }
}

#endif
