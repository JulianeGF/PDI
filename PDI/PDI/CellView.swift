import UIKit
import SnapKit

class CellView: UIView {
    
    private lazy var textView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.text = "xablau"
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
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
