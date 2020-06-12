import UIKit
import SwiftUI

public class CollectionViewCoordinator<CellType: UICollectionViewCell & Configurable>: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  @Binding private var items: [CellType.DataType]
  
  public init(_ items: Binding<[CellType.DataType]>) {
    self._items = items
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.stringIdentifier, for: indexPath) as? CellType ?? CellType()
    cell.configure(using: items[indexPath.row])
    return cell
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let dimension = (collectionView.frame.width - 20) / 3
    return .init(width: dimension, height: dimension)
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    .init(top: 5, left: 5, bottom: 5, right: 5)
  }
}
