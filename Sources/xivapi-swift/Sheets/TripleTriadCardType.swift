import Foundation

public struct TripleTriadCardType: Codable {
    public let row_id: Int
    public let value: Int
    public let sheet: String?
    public let fields: TripleTriadCardTypeFields
}

public struct TripleTriadCardTypeFields: Codable {
    public let Name: String
}
