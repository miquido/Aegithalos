#if canImport(UIKit)

import UIKit
import Aegithalos
  
public extension Setup where Subject: UITextView {
  
  @inlinable func font(_ font: UIFont) -> Setup {
    composed { textView in textView.font = font }
  }
  
  @inlinable func textContainerInset(_ inset: UIEdgeInsets) -> Setup {
    composed { textView in textView.textContainerInset = inset }
  }
  
  @inlinable func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Setup {
    composed { textView in textView.returnKeyType = returnKeyType }
  }
  
  @inlinable func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Setup {
    composed { textView in textView.textContainer.lineBreakMode = lineBreakMode }
  }
  
  @inlinable func lineFragmentPadding(_ padding: CGFloat) -> Setup {
    composed { textView in textView.textContainer.lineFragmentPadding = padding }
  }
  
  @inlinable func usesFontLeading(_ uses: Bool) -> Setup {
    composed { textView in textView.layoutManager.usesFontLeading = uses }
  }
  
  @inlinable func isScrollEnabled(_ enabled: Bool) -> Setup {
    composed { textView in textView.isScrollEnabled = enabled }
  }
  
  @inlinable func isEditable(_ editable: Bool) -> Setup {
    composed { textView in textView.isEditable = editable }
  }
  
  @inlinable func isSelectable(_ selectable: Bool) -> Setup {
    composed { textView in textView.isSelectable = selectable }
  }
  
  @inlinable func tintColor(_ color: UIColor) -> Setup {
    composed { label in label.tintColor = color }
  }
  
  @inlinable func textColor(_ color: UIColor) -> Setup {
    composed { textView in textView.textColor = color }
  }
  
  @inlinable func textAlignment(_ alignment: NSTextAlignment) -> Setup {
    composed { textView in textView.textAlignment = alignment }
  }
}

#endif
