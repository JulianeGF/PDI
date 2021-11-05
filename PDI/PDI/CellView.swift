import UIKit
import SnapKit

class CellView: UIView {
    
    private lazy var textView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private func addSubviews() {
        addSubview(textView)
    }
    
    private func constraintLayout() {
        textView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
    }
    
    func render(subCategory: CategoryModel) {
        addSubviews()
        constraintLayout()
        textView.text = subCategory.label
    }
}
