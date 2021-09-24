struct LinkModel: Codable {
    let href: String
    let context: String
    
    enum CodingKeys: String, Codable, CodingKey {
        case href
        case context
    }
}


