import Foundation

public struct Town: Codable {
    public let row_id: Int
    public let fields: TownFields
}

public struct TownFields: Codable {
    public let Icon: Icon
    public let Name: String
}
