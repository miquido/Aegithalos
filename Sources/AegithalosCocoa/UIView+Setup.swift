#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIView {
  
  @inlinable func frame(_ frame: CGRect) -> Setup {
    composed { view in view.frame = frame }
  }
  
  @inlinable func center(_ center: CGPoint) -> Setup {
    composed { view in view.center = center }
  }
  
  @inlinable func size(_ size: CGSize, preserveCenter: Bool = false) -> Setup {
    composed { view in
      view.frame
        = preserveCenter
        ? CGRect(center: view.frame.center, size: size)
        : CGRect(origin: view.frame.origin, size: size)
    }
  }
  
  @inlinable func cornerRadius(
    _ radius: CGFloat,
    corners: CACornerMask
    = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
  ) -> Setup {
    composed { view in
      view.layer.cornerRadius = radius
      view.layer.maskedCorners = corners
    }
  }
  
  @inlinable func borderWidth(_ width: CGFloat) -> Setup {
    composed { view in view.layer.borderWidth = width }
  }
  
  @inlinable func borderColor(_ color: UIColor?) -> Setup {
    composed { view in view.layer.borderColor = color?.cgColor }
  }
  
  @inlinable func backgroundColor(_ color: UIColor?) -> Setup {
    composed { view in view.backgroundColor = color }
  }
  
  @inlinable func clipsToBounds(_ clipsToBounds: Bool) -> Setup {
    composed { view in view.clipsToBounds = clipsToBounds }
  }
  
  @inlinable func isHidden(_ isHidden: Bool) -> Setup {
    composed { view in view.isHidden = isHidden }
  }
  
  @inlinable func alpha(_ alpha: CGFloat) -> Setup {
    composed { view in view.alpha = alpha }
  }
  
  @inlinable func isUserInteractionEnabled(_ enabled: Bool) -> Setup {
    composed { view in view.isUserInteractionEnabled = enabled }
  }
  
  @inlinable func transform(_ transform: CGAffineTransform) -> Setup {
    composed { view in view.transform = transform }
  }
  
  @inlinable func contentMode(_ mode: UIView.ContentMode) -> Setup {
    composed { view in view.contentMode = mode }
  }
  
  @inlinable func translatesAutoresizingMaskIntoConstraints(_ translates: Bool) -> Setup {
    composed { view in view.translatesAutoresizingMaskIntoConstraints = translates }
  }
  
  @inlinable func subview(_ view: UIView) -> Setup {
    composed { view in
      assert(view.superview == nil)
      view.addSubview(view)
    }
  }
  
  @inlinable func top(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Setup {
    composed { view in view.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true }
  }
  
  @inlinable func bottom(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Setup {
    composed { view in view.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true }
  }
  
  @inlinable func centerY(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Setup {
    composed { view in view.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true }
  }
  
  @inlinable func left(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Setup {
    composed { view in view.leftAnchor.constraint(equalTo: anchor, constant: constant).isActive = true }
  }
  
  @inlinable func leading(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Setup {
    composed { view in view.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true }
  }
  
  @inlinable func right(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Setup {
    composed { view in view.rightAnchor.constraint(equalTo: anchor, constant: constant).isActive = true }
  }
  
  @inlinable func trailing(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Setup {
    composed { view in view.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true }
  }
  
  @inlinable func centerX(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Setup {
    composed { view in view.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true }
  }
  
  @inlinable func width(equalTo constant: CGFloat) -> Setup {
    composed { view in view.widthAnchor.constraint(equalToConstant: constant).isActive = true }
  }
  
  @inlinable func height(equalTo constant: CGFloat) -> Setup {
    composed { view in view.heightAnchor.constraint(equalToConstant: constant).isActive = true }
  }
}

#endif
