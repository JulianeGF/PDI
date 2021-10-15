import UIKit
import Reusable

class CollectionViewCell: UICollectionViewCell, Reusable {
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func render() {
        let view = CellView(frame: frame)
        contentView.addSubview(view)
    }
}
