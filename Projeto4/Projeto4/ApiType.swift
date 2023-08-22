import Foundation

// Codable -> me obriga a ter todos os campos
// Decodable -> contrario
struct SuperheroResponseI: Decodable {
    var response: String
    var results: [SuperheroI]
}

struct SuperheroI : Decodable {
    var id: String
    var name: String
    var powerstats: PowerstatsI?
}

struct PowerstatsI: Decodable {
    var intelligence: String
    var strength: String
    var speed: String
    var durability: String
    var power: String
    var combat: String
}

//
////struct Superhero: Codable {
////    let id: String
////    let name: String
////    let powerstats: Powerstats
////    let biography: Biography
////    let appearance: Appearance
////    let work: Work
////    let connections: Connections
////    let image: Image
////}
//
//struct Biography: Codable {
//    let fullName: String
//    let alterEgos: String
//    let aliases: [String]
//    let placeOfBirth: String
//    let firstAppearance: String
//    let publisher: String
//    let alignment: String
//
//    enum CodingKeys: String, CodingKey {
//        case fullName = "full-name"
//        case alterEgos = "alter-egos"
//        case aliases
//        case placeOfBirth = "place-of-birth"
//        case firstAppearance = "first-appearance"
//        case publisher, alignment
//    }
//}
//
//struct Appearance: Codable {
//    let gender: String
//    let race: String
//    let height: [String]
//    let weight: [String]
//    let eyeColor: String
//    let hairColor: String
//
//    enum CodingKeys: String, CodingKey {
//        case gender, race, height, weight
//        case eyeColor = "eye-color"
//        case hairColor = "hair-color"
//    }
//}
//
//struct Work: Codable {
//    let occupation: String
//    let base: String
//}
//
//struct Connections: Codable {
//    let groupAffiliation: String
//    let relatives: String
//    enum CodingKeys: String, CodingKey {
//        case groupAffiliation = "group-affiliation"
//        case relatives
//    }
//}
//
//struct Image: Codable {
//    let url: String
//}
