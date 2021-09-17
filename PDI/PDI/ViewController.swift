import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = View.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        AF.request("https://www.elo7.com.br/categoria/acessorios").responseString { response in
            print(response)
        }
    }
}

class View: UIView {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray
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

