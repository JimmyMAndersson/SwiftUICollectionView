import UIKit.UICollectionView

public class GenericCollectionView<CellType: UICollectionViewCell & Configurable>: UICollectionView {
  public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    sharedInit()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    sharedInit()
  }
  
  private func sharedInit() {
    backgroundColor = .clear
    register(CellType.self, forCellWithReuseIdentifier: CellType.stringIdentifier)
  }
}
