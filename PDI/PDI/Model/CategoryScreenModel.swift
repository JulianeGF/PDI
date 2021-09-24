struct CategoryScreenModel: Codable {
    let subCategories: [CategoryModel]
    
    enum CodingKeys: String, Codable, CodingKey {
        case subCategories
    }
}
