import Foundation

struct Poke: Decodable {
    let name: String
    let id: Int
    let height: Int
    let weight: Int
    
}

struct Forms: Decodable {
    let name: String
    let url: URL
}


