import UIKit.UICollectionViewCell

public class CollectionViewCell<DataType: CustomStringConvertible>: UICollectionViewCell, Configurable {
  private let label = UILabel()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    sharedInit()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    sharedInit()
  }
  
  private func sharedInit() {
    backgroundColor = UIColor.blue.withAlphaComponent(0.4)
    layer.cornerRadius = Swift.min(frame.width, frame.height) * 0.2
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 1
    clipsToBounds = false
    
    addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  }
  
  public func configure(using data: DataType) {
    label.text = data.description
  }
  
  public override func prepareForReuse() {
    label.text = .none
  }
}
