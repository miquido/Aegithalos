import CoreGraphics

extension CGRect {

  public init(center: CGPoint, size: CGSize) {
    self.init(
      origin: CGPoint(
        x: center.x - size.width / 2,
        y: center.y - size.height / 2),
      size: size
    )
  }

  public var center: CGPoint {
    CGPoint(
      x: (maxX - minX) / 2,
      y: (maxY - minY) / 2
    )
  }
}
