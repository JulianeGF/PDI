struct CategoryModel: Codable {
    let label: String
    let link: LinkModel
    
    enum CodingKeys: String, Codable, CodingKey {
        case label
        case link
    }
}


