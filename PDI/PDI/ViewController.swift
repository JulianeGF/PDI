import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = View.init(frame: UIScreen.main.bounds)
    }
}

class View: UIView {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    public func set() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
           make.edges.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        set()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
