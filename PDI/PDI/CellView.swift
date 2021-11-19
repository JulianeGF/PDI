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
    
    private lazy var border: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private func addSubviews() {
        addSubview(textView)
        addSubview(border)
    }
    
    private func constraintLayout() {
        textView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        border.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(0.2)
        }
    }
    
    func render(subCategory: CategoryModel) {
        addSubviews()
        constraintLayout()
        textView.text = subCategory.label
    }
}
