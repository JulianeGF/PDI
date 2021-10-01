import UIKit

class CellView: UIView {
    
    private lazy var textView: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.adjustsFontForContentSizeCategory = true
            label.textColor = .darkGray
            label.numberOfLines = 0
            return label
        }()
}
