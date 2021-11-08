import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    private var model: CategoryScreenModel?
    
    private lazy var collectionView: UICollectionView = {
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        collectionView.register(cellType: CollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        AF.request("https://www.elo7.com.br/categoria").responseJSON { response in
            if let categoryScreen = try? JSONDecoder().decode(CategoryScreenModel.self, from: response.data!) {
                self.model = categoryScreen
                self.collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.subCategories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.render(subCategory: model?.subCategories[indexPath.item])
        return cell
    }
}
