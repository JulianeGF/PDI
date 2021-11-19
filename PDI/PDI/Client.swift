import Alamofire
import Foundation

class Client {
    func requestCategories(url: String, completion: @escaping (CategoryScreenModel) -> Void) {
        AF.request(url).validate().responseDecodable(of: CategoryScreenModel.self) { response in
            if let value = response.value {
                completion(value)
            }
        }
    }
}
