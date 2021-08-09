import UIKit
import SnapKit
import Alamofire

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let model = dataSource[indexPath.item]
        cell.filmsList.text = model.films
        return cell
    }
    
    var dataSource: [filmsList] = []
    
    override func loadView() {
        self.view = View.init(frame: UIScreen.main.bounds)
    }
    
    private func request() {
        let request = AF.request("https://swapi.dev/api/films/")
        request.responseJSON { (response) in
            if let films = try? JSONDecoder().decode([filmsList].self, from: response.data!) {
                self.dataSource = films
            }
        }
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

struct filmsList: Codable {
    let films: String
}

enum CodingKeys: String, Codable, CodingKey {
    case films
}
