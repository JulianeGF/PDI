import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = CollectionView.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        AF.request("https://www.elo7.com.br/categoria").responseJSON { response in
            if let categoryScreen = try? JSONDecoder().decode(CategoryScreenModel.self, from: response.data!) {
                print("farofa")
            }
        }
    }
}

class CollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionViewCell()
        cell.render()
        return cell
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        set()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
