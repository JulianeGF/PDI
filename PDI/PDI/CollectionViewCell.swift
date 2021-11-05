import UIKit
import Reusable

class CollectionViewCell: UICollectionViewCell, Reusable {
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func render(subCategory: CategoryModel?) {
        guard let subCategory = subCategory else { return }

        let view = CellView()
        view.render(subCategory: subCategory)
        contentView.addSubview(view)
    }
}
