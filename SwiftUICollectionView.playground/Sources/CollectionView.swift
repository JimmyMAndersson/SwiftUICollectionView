import UIKit.UICollectionView
import SwiftUI

public struct CollectionView<CellType: UICollectionViewCell & Configurable>: UIViewRepresentable {
  @Binding public var items: [CellType.DataType]
  private let layout: UICollectionViewFlowLayout
  
  public init(items: Binding<[CellType.DataType]>) {
    self._items = items
    self.layout = UICollectionViewFlowLayout()
  }
  
  public func updateUIView(_ uiView: GenericCollectionView<CellType>, context: Context) {
    uiView.reloadData()
  }
  
  public func makeUIView(context: Context) -> GenericCollectionView<CellType> {
    let view = GenericCollectionView<CellType>.init(frame: .zero, collectionViewLayout: layout)
    view.dataSource = context.coordinator
    view.delegate = context.coordinator
    return view
  }
  
  public func makeCoordinator() -> CollectionViewCoordinator<CellType> {
    CollectionViewCoordinator($items)
  }
}
