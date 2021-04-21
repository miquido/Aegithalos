#if canImport(UIKit)
import UIKit

internal extension UIGestureRecognizer {
  
  @usableFromInline func associate(
    _ closureHolder: ClosureHolder
  ) {
    objc_setAssociatedObject(
      self,
      closureHolderAssociationKeyPointer,
      closureHolder,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )
  }
}

// Allocate a single byte for objc associated object key.
@usableFromInline internal let closureHolderAssociationKeyPointer = UnsafeRawPointer(UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 0))

#endif
