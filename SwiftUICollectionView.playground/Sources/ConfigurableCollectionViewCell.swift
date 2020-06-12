import UIKit.UICollectionViewCell

public extension UICollectionViewCell {
  static var stringIdentifier: String { String(describing: Self.self) }
}

public protocol Configurable {
  associatedtype DataType
  func configure(using data: DataType) -> Void
}
