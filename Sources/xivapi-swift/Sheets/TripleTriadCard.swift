import Foundation

public struct TripleTriadCard: Codable {
    public let row_id: Int
    public let fields: TripleTriadCardFields
}

public struct TripleTriadCardFields: Codable {
    public let Description: String
    public let Name: String
}
