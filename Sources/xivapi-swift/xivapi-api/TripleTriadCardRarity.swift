import Foundation

public struct TripleTriadCardRarity: Codable {
    public let row_id: Int
    public let value: Int
    public let sheet: String?
    public let fields: TripleTriadCardRarityFields
}

public extension TripleTriadCardRarity {
    var stars: Int { fields.Stars }
}

public struct TripleTriadCardRarityFields: Codable {
    public let Stars: Int
}
