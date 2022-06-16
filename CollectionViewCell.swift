import UIKit
import Reusable
import SnapKit

class CollectionViewCell: UICollectionViewCell, Reusable {
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func render(subCategory: CategoryModel?) {
        guard let subCategory = subCategory else { return }

        let view = CellView()
        view.render(subCategory: subCategory)
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
